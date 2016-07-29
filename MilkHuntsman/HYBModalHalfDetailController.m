//
//  HYBModalHalfDetailController.m
//  HYBTransitionAnimations
//
//  Created by fengchunyan on 16/3/30.
//  Copyright © 2016年 lipeng. All rights reserved.
//

#import "HYBModalHalfDetailController.h"
#import "RecommendSearchBarTableViewController.h"
#import "RecommendViewController.h"

@implementation HYBModalHalfDetailController

- (void)viewDidLoad
{
  [super viewDidLoad];

    UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 1)];
    nextView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:nextView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 30, 10, 60, 50)];
    label.text = @"分类";
    [self.view addSubview:label];
  self.view.backgroundColor = [UIColor whiteColor];
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.frame = CGRectMake(self.view.frame.size.width - 60, 15, 50, 40);
  [button setTitle:@"X" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

  button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
  [self.view addSubview:button];

  [button addTarget:self action:@selector(onDismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addAllViews];
    
}

- (void)addAllViews
{
    
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button1 setTitle:@"本地生活" forState:(UIControlStateNormal)];
    [self.view addSubview:button1];
    UIButton *button2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button2 setTitle:@"线上活动" forState:(UIControlStateNormal)];
    [self.view addSubview:button2];
    UIButton *button3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button3 setTitle:@"美食" forState:(UIControlStateNormal)];
    [self.view addSubview:button3];
    UIButton *button4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button4 setTitle:@"城市微旅行" forState:(UIControlStateNormal)];
    [self.view addSubview:button4];
    UIButton *button5 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button5 setTitle:@"经验分享" forState:(UIControlStateNormal)];
    [self.view addSubview:button5];
    UIButton *button6 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button6 setTitle:@"技能get" forState:(UIControlStateNormal)];
    [self.view addSubview:button6];
    [button1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button3 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button4 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button5 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button6 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    _btn1 = button1;
    _btn2 = button2;
    _btn3 = button3;
    _btn4 = button4;
    _btn5 = button5;
    _btn6 = button6;
    _btn1.backgroundColor = [UIColor whiteColor];
    _btn2.backgroundColor = [UIColor whiteColor];
    _btn3.backgroundColor = [UIColor whiteColor];
    _btn4.backgroundColor = [UIColor whiteColor];
    _btn5.backgroundColor = [UIColor whiteColor];
    _btn6.backgroundColor = [UIColor whiteColor];
    _btn1.layer.cornerRadius = 10;
    _btn2.layer.cornerRadius = 10;
    _btn3.layer.cornerRadius = 10;
    _btn4.layer.cornerRadius = 10;
    _btn5.layer.cornerRadius = 10;
    _btn6.layer.cornerRadius = 10;
    _btn1.layer.masksToBounds = YES;
    _btn2.layer.masksToBounds = YES;
    _btn3.layer.masksToBounds = YES;
    _btn4.layer.masksToBounds = YES;
    _btn5.layer.masksToBounds = YES;
    _btn6.layer.masksToBounds = YES;
    _btn1.frame = CGRectMake(50, 120, 80, 50);
    _btn2.frame = CGRectMake(180, 120, 80, 50);
    _btn3.frame = CGRectMake(300, 120, 80, 50);
    _btn4.frame = CGRectMake(50, 220, 80, 50);
    _btn5.frame = CGRectMake(180, 220, 80, 50);
    _btn6.frame = CGRectMake(300, 220, 80, 50);
    [_btn1 sizeToFit];
    [_btn2 sizeToFit];
    [_btn3 sizeToFit];
    [_btn4 sizeToFit];
    [_btn5 sizeToFit];
    [_btn6 sizeToFit];
    
   
    [_btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:(UIControlEventTouchUpInside)];
    [_btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:(UIControlEventTouchUpInside)];
    [_btn3 addTarget:self action:@selector(btn3Action:) forControlEvents:(UIControlEventTouchUpInside)];
    [_btn4 addTarget:self action:@selector(btn4Action:) forControlEvents:(UIControlEventTouchUpInside)];
    [_btn5 addTarget:self action:@selector(btn5Action:) forControlEvents:(UIControlEventTouchUpInside)];
    [_btn6 addTarget:self action:@selector(btn6Action:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)btn1Action:(UIButton *)button
{


        RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
        NSString *str = @"117";
        listVC.btnStr = str;

    __weak typeof(self) weakSelf = self;
    [self presentViewController:listVC animated:YES completion:^{
        UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, weakSelf.view.frame.size.width, 64)];
        nextView.backgroundColor = [UIColor whiteColor];
        [listVC.view addSubview:nextView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(weakSelf.view.frame.size.width - 60, 15, 50, 40);
        [button setTitle:@"X" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [listVC.view addSubview:button];
        NSString *str = @"117";
        listVC.btnStr = str;

        [button addTarget:weakSelf action:@selector(onDismiss) forControlEvents:UIControlEventTouchUpInside];
    }];

    
}

- (void)btn2Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"116";
    listVC.btnStr = str;
    __weak typeof(self) weakSelf = self;
    [self presentViewController:listVC animated:YES completion:^{
        UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, weakSelf.view.frame.size.width, 64)];
        nextView.backgroundColor = [UIColor whiteColor];
        [listVC.view addSubview:nextView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(weakSelf.view.frame.size.width - 60, 15, 50, 40);
        [button setTitle:@"X" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [listVC.view addSubview:button];
        NSString *str = @"116";
        listVC.btnStr = str;

        [button addTarget:weakSelf action:@selector(onDismiss) forControlEvents:UIControlEventTouchUpInside];
    }];

    
}

- (void)btn3Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"119";
    listVC.btnStr = str;
    __weak typeof(self) weakSelf = self;
    [self presentViewController:listVC animated:YES completion:^{
        UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, weakSelf.view.frame.size.width, 64)];
        nextView.backgroundColor = [UIColor whiteColor];
        [listVC.view addSubview:nextView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(weakSelf.view.frame.size.width - 60, 15, 50, 40);
        [button setTitle:@"X" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [listVC.view addSubview:button];
        NSString *str = @"119";
        listVC.btnStr = str;

        [button addTarget:weakSelf action:@selector(onDismiss) forControlEvents:UIControlEventTouchUpInside];
    }];

    
}

- (void)btn4Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"106";
    listVC.btnStr = str;
    __weak typeof(self) weakSelf = self;
    [self presentViewController:listVC animated:YES completion:^{
        UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, weakSelf.view.frame.size.width, 64)];
        nextView.backgroundColor = [UIColor whiteColor];
        [listVC.view addSubview:nextView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(weakSelf.view.frame.size.width - 60, 15, 50, 40);
        [button setTitle:@"X" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        NSString *str = @"106";
        listVC.btnStr = str;

        button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [listVC.view addSubview:button];
        
        [button addTarget:weakSelf action:@selector(onDismiss) forControlEvents:UIControlEventTouchUpInside];
    }];

    
}

- (void)btn5Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"115";
    listVC.btnStr = str;
    __weak typeof(self) weakSelf = self;
    [self presentViewController:listVC animated:YES completion:^{
        UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, weakSelf.view.frame.size.width, 64)];
        nextView.backgroundColor = [UIColor whiteColor];
        [listVC.view addSubview:nextView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(weakSelf.view.frame.size.width - 60, 15, 50, 40);
        [button setTitle:@"X" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [listVC.view addSubview:button];
        NSString *str = @"115";
        listVC.btnStr = str;
        [button addTarget:weakSelf action:@selector(onDismiss) forControlEvents:UIControlEventTouchUpInside];
    }];

    
}

- (void)btn6Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"5";
    listVC.btnStr = str;
    __weak typeof(self) weakSelf = self;
    [self presentViewController:listVC animated:YES completion:^{
        UIView *nextView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, weakSelf.view.frame.size.width, 64)];
        nextView.backgroundColor = [UIColor whiteColor];
        [listVC.view addSubview:nextView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(weakSelf.view.frame.size.width - 60, 15, 50, 40);
        [button setTitle:@"X" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        [listVC.view addSubview:button];
        NSString *str = @"5";
        listVC.btnStr = str;
        [button addTarget:weakSelf action:@selector(onDismiss) forControlEvents:UIControlEventTouchUpInside];
    }];

    
}

- (void)onDismiss {
  [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
