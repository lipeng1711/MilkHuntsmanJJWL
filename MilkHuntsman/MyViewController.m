//
//  MyViewController.m
//  NiceProduct
//
//  Created by fengchunyan on 16/7/13.
//  Copyright © 2016年 张健. All rights reserved.
//

#import "MyViewController.h"
#import "CollectViewController.h"
#import "homePageViewController.h"

@interface MyViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
@property (weak, nonatomic) IBOutlet UIImageView *firstIV;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UIImageView *secondIV;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thirdIV;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UIImageView *forthIV;
@property (weak, nonatomic) IBOutlet UILabel *forthLabel;
@property (weak, nonatomic) IBOutlet UITableView *MyTableView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *HeadImageView;
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *integralLabel;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.myView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];

//    注册cell
    [self.MyTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"mycell"];

    [self passValue];
    
    [self backgroundImageViewClick];
    
    [self integralLabelClick];
    
    [self HeadImageViewCilck];
    
    [self AllClick];
    
}
//四个点击事件
- (void)AllClick{
    self.firstIV.userInteractionEnabled = YES;
    self.firstLabel.userInteractionEnabled = YES;
    self.secondIV.userInteractionEnabled = YES;
    self.secondLabel.userInteractionEnabled = YES;
    self.thirdIV.userInteractionEnabled = YES;
    self.thirdLabel.userInteractionEnabled = YES;
    self.forthIV.userInteractionEnabled = YES;
    self.forthLabel.userInteractionEnabled = YES;
    
    [self.firstIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(first:)]];
    [self.firstLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(first:)]];

    [self.thirdIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(third:)]];
    [self.thirdLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(third:)]];
    
    [self.forthIV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(forth:)]];
    [self.forthLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(forth:)]];
    
}
- (void)first:(UITapGestureRecognizer *)sender{
    //设置下个界面navigationbar字
    UIBarButtonItem *set = [UIBarButtonItem new];
    set.title = @"订单中心";
    self.navigationItem.backBarButtonItem = set;
    self.navigationController.navigationBar.hidden = NO;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    firstViewController *first = [story instantiateViewControllerWithIdentifier:@"firstViewController"];
    [self.navigationController pushViewController:first animated:YES];
}

- (void)third:(UITapGestureRecognizer *)sender{
    //设置下个界面navigationbar字
    UIBarButtonItem *set = [UIBarButtonItem new];
    set.title = @"我的优惠券";
    self.navigationItem.backBarButtonItem = set;
    self.navigationController.navigationBar.hidden = NO;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ThirdViewController *third = [story instantiateViewControllerWithIdentifier:@"ThirdViewController"];
    [self.navigationController pushViewController:third animated:YES];
}
- (void)forth:(UITapGestureRecognizer *)sender{
    //设置下个界面navigationbar字
    UIBarButtonItem *set = [UIBarButtonItem new];
    set.title = @"我的评价";
    self.navigationItem.backBarButtonItem = set;
    self.navigationController.navigationBar.hidden = NO;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ForthViewController *forth = [story instantiateViewControllerWithIdentifier:@"ForthViewController"];
    [self.navigationController pushViewController:forth animated:YES];
}

//换头像
- (void)HeadImageViewCilck{
    self.HeadImageView.userInteractionEnabled = YES;
    [self.HeadImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headimageview:)]];
}

- (void)headimageview:(UITapGestureRecognizer *)sender{
    //设置下个界面navigationbar字
    UIBarButtonItem *set = [UIBarButtonItem new];
    set.title = @"账户设置";
    self.navigationItem.backBarButtonItem = set;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AccountViewController *accountVC = [storyboard instantiateViewControllerWithIdentifier:@"AccountViewController"];
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController pushViewController:accountVC animated:YES];

}

//积分点击事件
- (void)integralLabelClick{
    self.integralLabel.userInteractionEnabled = YES;
    [self.integralLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTap:)]];
}
//积分跳转界面
- (void)labelTap:(UITapGestureRecognizer *)sender{
    
    //设置下个界面navigationbar字,必须初始化
    UIBarButtonItem *set = [UIBarButtonItem new];
    
    set.title = @"积分兑换";
    
    self.navigationItem.backBarButtonItem = set;
    
    self.navigationController.navigationBar.hidden = NO;

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    intagralViewController *integralVC = [storyboard instantiateViewControllerWithIdentifier:@"intagralViewController"];
    
    [JJZshare shareheadImage].integral = self.integralLabel.text;
    
    [self.navigationController pushViewController:integralVC animated:YES];
    
}

//背景图点击事件
- (void)backgroundImageViewClick{
    
    self.backgroundImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action:)];
    
    [self.backgroundImageView addGestureRecognizer:singleTap];
    
}
//换背景图跳转
- (void)action:(UITapGestureRecognizer *)sender{
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self ;
    //  提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换背景图" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    //    添加到控制器
    [alert addAction:action];
    [alert addAction:confirm];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
}
//获取到原图赋值到imageV上
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取到原图赋值到imageV上
    UIImage *temp = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.backgroundImageView.image = temp;
    
    //关闭模态
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
//视图将要显示
- (void)viewWillAppear:(BOOL)animated{
    //    隐藏
    self.navigationController.navigationBar.hidden = YES;
    self.HeadImageView.image = [JJZshare shareheadImage].changeImage;
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    if (app.hasLogined) {
        if ([JJZshare shareheadImage].headImage) {
            NSString *headImage = [JJZshare shareheadImage].headImage;
            NSData *imageData = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"imageName:%@",headImage]];
            self.HeadImageView.image = [UIImage imageWithData:imageData];
            self.nameLabel.text = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"myUserName%@",[JJZshare shareheadImage].headImage]];
        }
    }else{
        self.HeadImageView.image = nil;
        self.nameLabel.text = @"登录账号给自己取个个性名字吧!";
    }
}

//传值
- (void)passValue{
    //    圆角
    self.HeadImageView.layer.masksToBounds = YES;
    
    self.HeadImageView.layer.cornerRadius = self.HeadImageView.bounds.size.width / 2.0;
    
    [JJZshare shareheadImage].name = self.nameLabel.text;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    NSArray *array = @[@[@"游记&故事集"],@[@"邀请返利"],@[@"牛奶客服"],@[@"帮助中心"]];
    
    cell.onlyLabel.text = array[indexPath.section][indexPath.row];
   //右箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //圆角
    cell.layer.masksToBounds = YES;
    
    cell.layer.cornerRadius = cell.bounds.size.width / 50;
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"cell%ld.png",indexPath.section + 1]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

- (IBAction)setButton:(UIButton *)sender {
    
    //设置下个界面navigationbar字
    UIBarButtonItem *set = [UIBarButtonItem new];
    
    set.title = @"设置";
    
    self.navigationItem.backBarButtonItem = set;

//跳转
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];

    SetViewController *setVC = [storyboard instantiateViewControllerWithIdentifier:@"SetViewController"];

    [self.navigationController pushViewController:setVC animated:YES];
    
}
//头标题高度,只是为了漂浮效果
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5;
    
}
- (IBAction)AsHunt:(UIButton *)sender {
    
    //设置下个界面navigationbar字
    UIBarButtonItem *set = [UIBarButtonItem new];
    set.title = @"";
    self.navigationItem.backBarButtonItem = set;
    self.navigationController.navigationBar.hidden = NO;
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    AsAHuntViewController *asVC = [story instantiateViewControllerWithIdentifier:@"AsAHuntViewController"];
    
    [self.navigationController pushViewController:asVC animated:YES];
    
    
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
