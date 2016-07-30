//
//  SetViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "SetViewController.h"
#import <objc/runtime.h>



@interface SetViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UIScrollViewDelegate,
UINavigationControllerDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *setTableVIew;

@property(nonatomic,strong)NSArray *groupArray;

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,assign)BOOL isSelect;

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(Actionss:) name:@"error" object:nil];
 
    self.groupArray = [[NSArray alloc]initWithObjects:@"个人设置",@"系统设置", nil];

    self.dataArray = @[@[@"账户设置",@"密码设置",@"添加好友"],@[@"推送通知设置",@"连接社交网络",@"清空缓存",@"关于我们",@"去评分",@"意见反馈"]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:53/255.0 green:191/255.0 blue:202/255.0 alpha:1];


    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:(UIBarButtonItemStyleDone) target:self action:@selector(OUT:)];
    AppDelegate*app = [UIApplication sharedApplication].delegate;
    if (app.hasLogined) {
        [self.navigationItem.rightBarButtonItem setTitle:@"退出登录"];
    }

    //    注册cell
    [self.setTableVIew registerNib:[UINib nibWithNibName:@"SetTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"setcell"];    
}


-(void)Actionss:(NSNotification*)sender{

    self.navigationItem.rightBarButtonItem.title = @"退出登录";

}

//退出/登录
- (void)OUT:(UIBarButtonItem *)sender{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoginAndEnterViewController *outVC = [story instantiateViewControllerWithIdentifier:@"LoginAndEnterViewController"];
    
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"登录"]) {
        [self presentViewController:outVC animated:YES completion:^{
            
        }];
        
    }else if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"退出登录"]) {
        //  提示框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定推出登录?" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            //退出登录
            EMError *error = [[EMClient sharedClient] logout:YES];
            if (!error) {
                NSLog(@"退出成功");
                AppDelegate * app = [UIApplication sharedApplication].delegate;
                app.hasLogined = NO;
                self.navigationItem.rightBarButtonItem.title = @"登录";
            }
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
        //    添加到控制器
        [alert addAction:action];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray[section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"setcell"];
    cell.setLabel.text = self.dataArray[indexPath.section][indexPath.row];
    cell.cacheLabel.alpha = 0.5;
    if (indexPath.section == 1 && indexPath.row == 2) {
        cell.cacheLabel.text = [NSString stringWithFormat:@"%.1fMB",[self getFilePath]];
    }else{
        cell.cacheLabel.text = nil;
    }
    return cell;
}
//计算缓存
-(float)getFilePath{
    //文件管理
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //缓存路径
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    NSArray *cacheFileList;
    NSEnumerator *cacheEnumerator;
    NSString *cacheFilePath;
    unsigned long long cacheFolderSize = 0;
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    cacheEnumerator = [cacheFileList objectEnumerator];
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
        cacheFolderSize += [cacheFileAttributes fileSize];
    }
    //单位KB
    return cacheFolderSize/1024/1024;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.groupArray[section];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}
//cell的点击方法
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置下个界面navigationbar字,必须初始化
    UIBarButtonItem *set = [UIBarButtonItem new];
    set.title = @"账户设置";
    self.navigationItem.backBarButtonItem = set;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AccountViewController *accountVC = [storyboard instantiateViewControllerWithIdentifier:@"AccountViewController"];
    if (indexPath.section == 0 && indexPath.row == 0) {
        if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"登录"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请先登录" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            }];
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            }];
            //    添加到控制器
            [alert addAction:action];
            [alert addAction:confirm];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
        }else{
            [self.navigationController pushViewController:accountVC animated:YES];
        }
    }else if (indexPath.section == 1 && indexPath.row == 2) {
        //缓存路径
        NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *cacheDir = [cachePaths objectAtIndex:0];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否清除缓存" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        }];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            [self removeCache:cacheDir];
            [self.setTableVIew reloadData];
        }];
        //    添加到控制器
        [alert addAction:action];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
        //好友列表
    }else if (indexPath.section == 0 && indexPath.row == 2){
        if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"登录"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请先登录" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
            }];
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            }];
            //    添加到控制器
            [alert addAction:action];
            [alert addAction:confirm];
            [self presentViewController:alert animated:YES completion:^{
                
            }];
            
        }else{
            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            FriendListViewController *friendVC = [story instantiateViewControllerWithIdentifier:@"FriendListViewController"];
            [self.navigationController pushViewController:friendVC animated:YES];
        }
    }
}

//清除缓存
- (void)removeCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
}


//取消粘滞效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 26;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
//头标题样式
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor lightGrayColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
    if (section == 0) {
        headerLabel.text =  @"个人设置";
    }else if (section == 1){
        headerLabel.text = @"系统设置";
    }else if (section == 2){
        headerLabel.text = @"测试3";
    }else if (section == 3){
        headerLabel.text = @"测试4";
    }
    [customView addSubview:headerLabel];
    return customView;
}



-(void)passValueError:(EMError*)error{
    
    if (!error) {
        
        NSLog(@"==================%s",__func__);
        self.navigationItem.title=@"退出登录";
    }
 
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
