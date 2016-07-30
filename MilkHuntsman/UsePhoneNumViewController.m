//
//  UsePhoneNumViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "UsePhoneNumViewController.h"
#import "MyRequestURL.h"
#import "EMSDK.h"
@interface UsePhoneNumViewController ()

@property (strong, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@end

@implementation UsePhoneNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
- (IBAction)returnButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
- (IBAction)enter:(UIButton *)sender {
    //验证,判断 用户名和密码(正则表达式)
    if ([self.userNameTextField.text length] == 0) {
        NSLog(@"用户名为空");
    }
    else if ([self.passWordTextField.text length] == 0){
        NSLog(@"密码为空");
    }else{
        EMError *error = [[EMClient sharedClient] loginWithUsername:self.userNameTextField.text password:self.passWordTextField.text];
        if (!error) {
            NSLog(@"登录成功");
            [[NSNotificationCenter defaultCenter]postNotificationName:@"error" object:nil];
            AppDelegate * app = [UIApplication sharedApplication].delegate;
            app.hasLogined = YES;
            //获取用户信息~~~~~~~~~~~~~
            NSString *userName = self.userNameTextField.text;
            [JJZshare shareheadImage].headImage = self.userNameTextField.text;
            NSUserDefaults *defaults = [NSUserDefaults new];
            [defaults setObject:userName forKey:self.userNameTextField.text];
            [self alertWithTitle:@"消息" message:@"确定" alertAction:(UIAlertActionStyleDefault) emrror:error];
            //自动登录
            //        [[EMClient sharedClient].options setIsAutoLogin:YES];
        }
    }
}
// 正则判断手机号码地址格式
- (BOOL)isMobileNumber:(NSString *)mobileNum {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     * 联通：130,131,132,152,155,156,176,185,186,
     * 电信：133,1349,153,180,181,189,173,177
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[0-27-9]|78|8[23478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,176,185,186,
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|76|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,181,189,173,177
     22         */
    NSString * CT = @"^1((33|53|7[37]|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//Alert弹出框的封装方法
-(UIAlertController *)alertWithTitle:(NSString *)title message:(NSString *)message alertAction:(UIAlertActionStyle)alertAction emrror:(EMError*)emerror{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertControllerStyleAlert 在屏幕中间
    //UIAlertControllerStyleActionSheet 在屏幕底部
    UIAlertAction *Destructive = [UIAlertAction actionWithTitle:@"确定" style:alertAction handler:^(UIAlertAction * _Nonnull action) {
        /*
         UIAlertActionStyleDefault,
         UIAlertActionStyleCancel,
         UIAlertActionStyleDestructive
         */
        //登录成功之后消失
        [self dismissViewControllerAnimated:YES completion:^{
   
            [self.delegateTwo dissmissTwo];
//            [self.delegate passValueError:emerror];
            
        }];

    }];
    // 显示
    [self presentViewController:alert animated:YES completion:nil];
    [alert addAction:Destructive];
    
    return alert;
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
