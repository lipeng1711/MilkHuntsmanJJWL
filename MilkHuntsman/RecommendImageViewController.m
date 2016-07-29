//
//  RecommendImageViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/21.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendImageViewController.h"

@interface RecommendImageViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation RecommendImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, WindownWidth, WindowHeight + 49)];
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.imageUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [self.webView loadRequest:request];
    
}
//隐藏tabbar
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    [GiFHUD show];
    [milk hiddenTabBar];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [GiFHUD dismiss];
}
//显示tabbar
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk showTabBar];
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
