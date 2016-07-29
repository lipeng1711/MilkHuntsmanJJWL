//
//  loginViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "loginViewController.h"
#import "RegisterRequest.h"
#import "EMSDK.h"
@interface loginViewController ()
@property (strong, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *numTF;

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}
//- (IBAction)ChinaButton:(UIButton *)sender {
//    
//    //  提示框
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你他妈还真想选其他国家?" message: nil preferredStyle:(UIAlertControllerStyleAlert)];
//    
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"滚回去" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//    }];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"不回去也得回去" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
//    }];
//    //    添加到控制器
//    [alert addAction:action];
//    [alert addAction:cancel];
//    [self presentViewController:alert animated:YES completion:^{
//        
//    }];
//
//    
//}
//获取验证码
- (IBAction)getButton:(id)sender {
    [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethodSMS) phoneNumber:self.phoneTF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!error) {
                UIAlertView*alertView=[[UIAlertView alloc]initWithTitle:@"提示信息" message:@"验证码已经发送,请注意查收" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                [alertView show];
            }else{
                UIAlertView*alertV=[[UIAlertView alloc]initWithTitle:@"提示信息" message:@"验证码发送失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                [alertV show];
            }
        });
    }];
}
//提交验证码(注册)
- (IBAction)agreeButton:(id)sender {
    [SMSSDK commitVerificationCode:self.numTF.text phoneNumber:self.phoneTF.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功!");
        }else{
            NSLog(@"验证失败!");
        }
    }];

#pragma mark 环信注册
    if (self.passWordTF.text.length >= 6 && self.passWordTF.text.length > 0) {
        EMError *error = [[EMClient sharedClient] registerWithUsername:self.phoneTF.text password:self.passWordTF.text];
        if (error==nil) {
            NSLog(@"注册成功");
            [self dismissViewControllerAnimated:YES completion:^{
                [self.delegate dismiss];
            }];
        }else{
            NSLog(@"用户已存在");
        }
    }else{
        NSLog(@"密码不能小于6位");
    }
}

- (IBAction)returnButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
- (IBAction)delegate:(UIButton *)sender {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    delegateViewController *delegate = [story instantiateViewControllerWithIdentifier:@"delegateViewController"];
    
    [self presentViewController:delegate animated:YES completion:^{
        
    }];
   
}
- (IBAction)haveToLogin:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
