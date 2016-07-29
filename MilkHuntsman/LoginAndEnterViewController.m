//
//  LoginAndEnterViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "LoginAndEnterViewController.h"
#import <Wilddog/Wilddog.h>
#import "WeiboSDK.h"
@interface LoginAndEnterViewController ()<dismiss,dissmissTwo,WeiboSDKDelegate>
@property (nonatomic, strong) Wilddog *ref;
// The user currently authenticed with Wilddog
@property (nonatomic, strong) WAuthData *currentUser;
// A dialog that is displayed while logging in
@property (nonatomic, strong) UIAlertView *loginProgressAlert;

@end

@implementation LoginAndEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //微博第三方登录
    self.ref = [[Wilddog alloc] initWithUrl:kWilddogURL];
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
    
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk hiddenTabBar];

}
- (IBAction)returnButton:(UIButton *)sender {

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (IBAction)loginClick:(UIButton *)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    loginViewController *login = [storyBoard instantiateViewControllerWithIdentifier:@"loginViewController"];
    login.delegate=self;
    [self presentViewController:login animated:YES completion:^{
        
    }];
    
}
-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)dissmissTwo{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)usePhoneNumEnter:(UIButton *)sender {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UsePhoneNumViewController *use = [story instantiateViewControllerWithIdentifier:@"UsePhoneNumViewController"];
    use.delegateTwo = self;
    [self presentViewController:use animated:YES completion:^{
        
    }];
    
}

- (IBAction)WeiBoLogin:(UIButton *)sender {
    
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"https://api.weibo.com/oauth2/default.html";
    request.scope = @"email,direct_messages_write";
    request.userInfo = @{@"SSO_From": @"WDLoginViewController",
                             @"Other_Info_1": [NSNumber numberWithInt:123], @"Other_Info_2": @[@"obj1", @"obj2"],
                             @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
    
}
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request{
    
}
//非网络错误导致登录失败：
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    
}
//网络错误导致登录失败：
-(void)tencentDidNotNetWork
{
    
}
#pragma mark - 退出登录
- (void)logoutButtonPressed
{
    // logout of Wilddog and set the current user to nil
    [self.ref unauth];
    [self updateUIAndSetCurrentUser:nil];
}
#pragma mark -
- (void)showProgressAlert
{
    // show an alert notifying the user about logging in
    self.loginProgressAlert = [[UIAlertView alloc] initWithTitle:nil
                                                         message:@"正在登录..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [self.loginProgressAlert show];
}

- (void(^)(NSError *,WAuthData *))loginBlockForProviderName:(NSString *)providerName
{
    // this callback block can be used for every login method
    return ^(NSError *error, WAuthData *authData){
        // hide the login progress dialog
        [self.loginProgressAlert dismissWithClickedButtonIndex:0 animated:YES];
        self.loginProgressAlert = nil;
        if (error != nil) {
            // there was an error authenticating with Wilddog
            NSLog(@"Error logging in to Wilddog: %@", error);
            // display an alert showing the error message
            NSString *message = [NSString stringWithFormat:@"There was an error logging into Wilddog using %@: %@",
                                 providerName,
                                 [error localizedDescription]];
            [self showErrorAlertWithMessage:message];
        } else {
            // all is fine, set the current user and update UI
            [self updateUIAndSetCurrentUser:authData];
        }
    };
}

- (BOOL)wilddogIsSetup
{
    if ([@"https://<your-wilddog-app>.wilddogio.com" isEqualToString:kWilddogURL]) {
        [self showErrorAlertWithMessage:@"请先设置您的 kWilddogURL"];
        return NO;
    } else {
        return YES;
    }
}


// sets the user and updates the UI
- (void)updateUIAndSetCurrentUser:(WAuthData *)currentUser
{
    // set the user
    self.currentUser = currentUser;
    if (currentUser == nil) {
        // The is no user authenticated, so show the login buttons and hide the logout button
//        self.loginStatusLabel.hidden = YES;
//        self.logoutButton.hidden = YES;
//        self.QQLoginButton.hidden = NO;
//        self.weixinLoginButton.hidden = NO;
//        self.weiboLoginButton.hidden = NO;
//        self.anonymousLoginButton.hidden = NO;
    } else {
        // update the status label to show which user is logged in using which provider
        NSString *statusText;
        if ([currentUser.provider isEqualToString:@"qq"]) {
            statusText = [NSString stringWithFormat:@"Logged in as %@ (QQ)",
                          currentUser.providerData[@"username"]];
        } else if ([currentUser.provider isEqualToString:@"weixin"]) {
            statusText = [NSString stringWithFormat:@"Logged in as %@ (weixin)",
                          currentUser.providerData[@"username"]];
        } else if ([currentUser.provider isEqualToString:@"weibo"]) {
            statusText = [NSString stringWithFormat:@"Logged in as %@ (weibo)",
                          currentUser.providerData[@"username"]];
        } else if ([currentUser.provider isEqualToString:@"anonymous"]) {
            statusText = @"Logged in anonymously";
        } else {
            statusText = [NSString stringWithFormat:@"Logged in with unknown provider"];
        }
//        self.loginStatusLabel.text = statusText;
//        self.loginStatusLabel.hidden = NO;
//        // show the logout button
//        self.logoutButton.hidden = NO;
//        // hide the login button for now
//        self.QQLoginButton.hidden = YES;
//        self.weixinLoginButton.hidden = YES;
//        self.weiboLoginButton.hidden = YES;
//        self.anonymousLoginButton.hidden = YES;
    }
}

- (void)showErrorAlertWithMessage:(NSString *)message
{
    // display an alert with the error message
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
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
