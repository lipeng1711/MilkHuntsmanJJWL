//
//  CreateViewController.m
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/30.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CreateViewController.h"
#import "UIImage+ZJImageExtension.h"
#import "ScanViewController.h"

@interface CreateViewController ()

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) UIImageView *lastImageV;

@property (nonatomic, strong) UIImageView *backgroundImageV;

@property (nonatomic, strong) UIButton *scanBtn;

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self addAllViews];
#pragma mark ======== 第一种 ============
    // 二维码中的图片
    UIImage *icon = [UIImage imageNamed:@"bigMax"];
    // 生成二维码，二维码中带有自定义图片
    self.imageV.image = [UIImage createQRCodeWithSize:200 dataString:@"http://web.breadtrip.com" QRCodeImageType:circularImage iconImage:icon iconImageSize:40];
#pragma mark ======== 第二种 ============
    // 生成二维码
    UIImage *qrImage = [UIImage createQRCodeWithSize:150 dataString:@"http://web.breadtrip.com" QRCodeImageType:squareImage iconImage:icon iconImageSize:40];
    // 自定义背景图片
    UIImage *bgImage = [UIImage imageNamed:@"flower"];
    self.lastImageV.image = [UIImage addQRCodeBgImage:bgImage bgImageSize:200 QRImage:qrImage];
    // 测试
    
}

- (void)addAllViews{
    
    
    self.backgroundImageV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.backgroundImageV.image = [UIImage imageNamed:@"89393-100.jpg"];
    [self.view addSubview:self.backgroundImageV];
    
    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:self.imageV];
    
    self.lastImageV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_imageV.frame), CGRectGetMaxY(_imageV.frame)+40, 200, 200)];
    [self.view addSubview:self.lastImageV];
    
    self.scanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.scanBtn.frame = CGRectMake(CGRectGetMinX(_lastImageV.frame)+25, CGRectGetMaxY(_lastImageV.frame)+40, 150, 50);
    [self.scanBtn setTitle:@"扫描二维码(慎点)" forState:(UIControlStateNormal)];
    [self.scanBtn setTintColor:[UIColor whiteColor]];
    [self.scanBtn addTarget:self action:@selector(scanBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.scanBtn];
}

- (void)scanBtnAction:(UIButton *)sender{
    ScanViewController *scanVC = [ScanViewController new];
    [self presentViewController:scanVC animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
