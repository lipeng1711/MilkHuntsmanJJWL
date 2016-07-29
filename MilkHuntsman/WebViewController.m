//
//  WebViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "WebViewController.h"
#import "NetWorkRequest.h"
//收藏用到的coreData
#import "coreManager.h"
#import "CollectViewController.h"

#import <UMSocialData.h>
#import <UMSocialSnsService.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialQQHandler.h>
#import <UMSocialSnsPlatformManager.h>
#import <UMSocialConfig.h> //支持横屏

@interface WebViewController1 ()<UMSocialUIDelegate>

@property (nonatomic, strong) UIWebView *findDetailWebView;

//收藏列表属性
@property (nonatomic, strong) WebViewController1 *collectVC;
//又写了收藏按钮改值
@property (nonatomic, strong) UIBarButtonItem *collectItem;

@end

@implementation WebViewController1

//加载一个view挡住网页版的标题
- (void)viewWillAppear:(BOOL)animated{
    
    [GiFHUD show];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk hiddenTabBar];

    
    
    coreManager *manager = [coreManager new];
    if ([manager selectObjextContext:self.model.product[@"title"]]) {
        self.collectItem.title = @"已收藏";
    }
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 25)];
    view1.backgroundColor = [UIColor colorWithRed:0.29 green:0.74 blue:0.80 alpha:1.00];
    [self.view addSubview:view1];

}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [GiFHUD dismiss];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk showTabBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addAllViews];
    
    [self loadWebView];
    
    [self addItem];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.29 green:0.74 blue:0.80 alpha:1.000]];
    
    
}

//添加导航栏按钮
- (void)addItem{
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc] initWithTitle:@"收藏" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightItemCollertAction:)];
    self.collectItem = rightItem1;
    
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightItemShareAction:)];
    self.navigationItem.rightBarButtonItems = @[rightItem1,rightItem2];
    
}

//收藏按钮方法
- (void)rightItemCollertAction:(UIBarButtonItem *)sender{
    
    NSString *titleString = _model.product[@"title"];
    coreManager *manager = [coreManager new];
    if ([manager selectObjextContext:titleString]) {
        //弹框提示
        [self alertWindow];
    }else{
        //添加到数据库
        [manager addObjectContext:self.model.product[@"title"] string:[NSString stringWithFormat:@"%@",self.model.product_id] priceStr:self.model.product[@"price"] coverStr:self.model.product[@"cover"]];
        
        self.collectItem.title = @"已收藏";
    }
}

//alert弹出框
- (void)alertWindow{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"该内容已收藏" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}


//分享按钮方法
- (void)rightItemShareAction:(UIBarButtonItem *)sender{
#pragma mark ======== 支持横屏分享 ====================
    // 支持分享编辑页和授权页面横屏
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscape];
    
    //根据你要支持的方向，UIInterfaceOrientationMaskLandscape设置成相应的方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskLandscape];
    
#pragma mark =========== 实现分享 ====================
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ]
                                       delegate:self];
    //当分享消息类型为图文时，点击分享内容会跳转到预设的链接
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    //设置微信好友title方法为
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"微信好友title";
    //纯文字分享类型方法
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeText;
    //QQ设置title方法为
    [UMSocialData defaultData].extConfig.qqData.title = @"QQ分享title";
    
}


//初始化webView
- (void)addAllViews{
    
    self.findDetailWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 21, WindownWidth, WindowHeight - 21)];
    [self.view addSubview:self.findDetailWebView];
    
}


//加载网址
- (void)loadWebView{
    
    //缓存策略 超时限制
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",FindDetailRequest_Url(_passID)]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [self.findDetailWebView loadRequest:request];
    
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
