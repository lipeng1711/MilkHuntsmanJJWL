//
//  AsAHuntViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/20.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "AsAHuntViewController.h"
#import "MyRequestURL.h"
@interface AsAHuntViewController ()

@property(nonatomic,strong)UIWebView *myWebView;

@end

@implementation AsAHuntViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:53/255.0 green:191/255.0 blue:202/255.0 alpha:1];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    self.myWebView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:self.myWebView];
    
    NSURL *url = [NSURL URLWithString:AsHunterRequest_URL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [self.myWebView loadRequest:request];

}

- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
