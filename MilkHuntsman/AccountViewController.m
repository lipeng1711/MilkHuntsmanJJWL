//
//  AccountViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UINavigationControllerDelegate,
UIImagePickerControllerDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *AccountTableView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:53/255.0 green:191/255.0 blue:202/255.0 alpha:1];
    
    [self.AccountTableView registerNib:[UINib nibWithNibName:@"AccountTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"accountCell"];
    
    [self passValue];
    
    [self headImageViewClick];
    
}


//头像点击事件,调用系统相册或者相机
- (void)headImageViewClick{
    
    self.headImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action:)];
    
    [self.headImageView addGestureRecognizer:singleTap];
    
}

//实现头像点击事件
- (void)action:(UITapGestureRecognizer *)sender{
    /*
     UIImagePickerController是系统提供的用来获取图片和视频的接口
     用UIImagePickerController 类来获取图片视频，大体分为以下几个步骤：
     1. 初始化UIImagePickerController 类；
     2. 设置UIImagePickerController 实例的数据来源类型（下面解释）；
     3. 设置代理；
     4. 如果需要做图片修改的话设置 allowsEditing =yes。
     enum {
     UIImagePickerControllerSourceTypePhotoLibrary ,//来自图库
     UIImagePickerControllerSourceTypeCamera ,//来自相机
     UIImagePickerControllerSourceTypeSavedPhotosAlbum //来自相册
     };
     */
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self ;
    //  提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换头像" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
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
    self.headImageView.image = temp;
    
    NSString *headImage = [JJZshare shareheadImage].headImage;
//    NSLog(@"%@",headImage);
    NSData * imageData = UIImageJPEGRepresentation(temp, 1);
    [[NSUserDefaults standardUserDefaults] setValue:imageData forKey:[NSString stringWithFormat:@"imageName:%@",headImage]];
//    NSData与UIImage相互转换
//    NSData *imageData = [NSData dataWithContentsOfFile: imagePath];
//    UIImage *image = [UIImage imageWithData: imageData];
    
    [JJZshare shareheadImage].changeImage = temp;
    //关闭模态
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    self.headImageView.image = [JJZshare shareheadImage].changeImage;
    if ([JJZshare shareheadImage].headImage) {
        NSString *headImage = [JJZshare shareheadImage].headImage;
       NSData *imageData = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"imageName:%@",headImage]];
        self.headImageView.image = [UIImage imageWithData:imageData];
    }
    
}

//传值
- (void)passValue{
    //    圆角
    self.headImageView.layer.masksToBounds = YES;
    
    self.headImageView.layer.cornerRadius = self.headImageView.bounds.size.width / 2.0;
    
//    self.headImageView.image = [JJZshare shareheadImage].image;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 7;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accountCell"];
    
    cell.textLabel.alpha = 0.4;
    
    NSArray *array = @[@[@"用户名"],@[@"手机号码"],@[@"电子邮箱"],@[@"地区"],@[@"性别"],@[@"生日"],@[@"个人介绍"]];
    
    cell.textLabel.text = array[indexPath.section][indexPath.row];
    
    if (indexPath.section == 0) {
        
        cell.detailTextLabel.text = [JJZshare shareheadImage].name;
        
    }else{
        
        cell.detailTextLabel.text = @"未填写";
        
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

//头标题高度,只是为了漂浮效果
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5;
    
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
