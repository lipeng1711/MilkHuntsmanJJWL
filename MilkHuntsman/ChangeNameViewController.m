//
//  ChangeNameViewController.m
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/30.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "ChangeNameViewController.h"

@interface ChangeNameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nowNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *NewNameTextField;

@end

@implementation ChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:(UIBarButtonItemStyleDone) target:self action:@selector(OK:)];
}

- (void)OK:(UIBarButtonItem *)sender{
    //  提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定?" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        //存入新用户名
        [[NSUserDefaults standardUserDefaults]setObject:self.NewNameTextField.text forKey:[NSString stringWithFormat:@"myUserName%@",[JJZshare shareheadImage].headImage]];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        [self.navigationController popViewControllerAnimated:YES];
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

- (void)viewWillAppear:(BOOL)animated{
    self.nowNameLabel.text = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"myUserName%@",[JJZshare shareheadImage].headImage]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
