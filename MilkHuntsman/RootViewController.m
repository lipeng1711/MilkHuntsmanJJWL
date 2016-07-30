//
//  RootViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/6/28.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RootViewController.h"
#import "DCPathButton.h"
#import "CameraViewController.h"
#import "MapViewController.h"
#import "CreateViewController.h"

@interface RootViewController ()<MilkHuntsmanTabBarDelegate,DCPathButtonDelegate>

@property (nonatomic,strong) DCPathButton *dcButton;
@property(assign,nonatomic)BOOL isNight;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNight = YES;
  //把系统自带的tabBar隐藏掉
    self.tabBar.hidden = YES;
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self setChildButton:btn1 title:@"推荐" image:@"paper" selected:@"paperH"];
    
    UIButton *btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self setChildButton:btn2 title:@"发现" image:@"video" selected:@"videoH"];
    
    UIButton *btn3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self setChildButton:btn3 title:@"加号" image:@"2image" selected:@"2imageH"];
    
    UIButton *btn4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self setChildButton:btn4 title:@"消息" image:@"person" selected:@"personH"];
    
    UIButton *btn5 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self setChildButton:btn5 title:@"我的" image:@"person" selected:@"personH"];

    
    self.milkHuntsmanTabBar=[[MilkHuntsmanTabBar alloc] initWithItems:@[btn1,btn2,btn3,btn4,btn5] frame:CGRectMake(0, WindowHeight - 49, WindownWidth, 49)];
    [self.view addSubview:self.milkHuntsmanTabBar];
  //遵循代理
    self.milkHuntsmanTabBar.MilkHuntsmanDelegate = self;
    btn3.selected = NO;
    btn3.hidden = YES;
    
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                         highlightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    
    dcPathButton.delegate = self;
    
    // Configure item buttons
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
        DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    [dcPathButton addPathItems:@[itemButton_1,
                                 itemButton_2,
                                 itemButton_3,
                                 itemButton_4,
                                 ]];
    
    dcPathButton.bloomRadius = 120.0f;
    
    dcPathButton.dcButtonCenter = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 25.5f);
    
    dcPathButton.allowSounds = YES;
    dcPathButton.allowCenterButtonRotation = YES;
    
    dcPathButton.bottomViewColor = [UIColor grayColor];
    
    dcPathButton.bloomDirection = kDCPathButtonBloomDirectionTop;
    
    _dcButton = dcPathButton;
    [self.view addSubview:self.milkHuntsmanTabBar];
    [self.view addSubview:dcPathButton];
   
    //注册观察者,接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeToNight:) name:@"changeToNight" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeToDay:) name:@"changeToDay" object:nil];
}

- (void)willPresentDCPathButtonItems:(DCPathButton *)dcPathButton {
    
    NSLog(@"ItemButton will present");
    
}
//点击各个button的方法
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex {
    NSLog(@"You tap %@ at index : %lu", dcPathButton, (unsigned long)itemButtonIndex);
    
#pragma mark ============ 地图 ============
    
    if (itemButtonIndex == 1) {
        __weak typeof(self) weakSelf = self;
        MapViewController *mapVC = [MapViewController new];
        
        mapVC.mapCityName = @"北京";
        [self presentViewController:mapVC animated:YES completion:^{
            UIView *textView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WindownWidth, 64)];
            textView.backgroundColor = [UIColor colorWithRed:0.164 green:0.657 blue:0.915 alpha:1.000];
            [mapVC.view addSubview:textView];
            UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
            button.frame = CGRectMake(WindownWidth - 60, 15, 40, 40);
            [button setTitle:@"back" forState:(UIControlStateNormal)];
            [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            [textView addSubview:button];
            [button addTarget:weakSelf action:@selector(backAction:) forControlEvents:(UIControlEventTouchUpInside)];
            
        }];
    }
#pragma mark ========== 点击夜间模式button的方法 =====================
    //夜间模式
    if (itemButtonIndex == 3) {
        if (self.isNight) {
            //改变当前夜间模式状态
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeToNight" object:nil userInfo:@{@"status":[NSNumber numberWithBool:self.isNight]}];
            self.isNight = NO;
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeToDay" object:nil userInfo:@{@"statusDay":[NSNumber numberWithBool:self.isNight]}];
            self.isNight = YES;
        }
    }
    
#pragma mark ============== 调用相机 ====================
    if (itemButtonIndex == 2) {
        CameraViewController *cameraVC = [CameraViewController new];
        [self presentViewController:cameraVC animated:YES completion:nil];
    }
    
#pragma mark ============== 生成二维码 ================
    if (itemButtonIndex == 0) {
        CreateViewController *createVC = [CreateViewController new];
        [self presentViewController:createVC animated:YES completion:nil];
    }

}

- (void)didPresentDCPathButtonItems:(DCPathButton *)dcPathButton {
    
    NSLog(@"ItemButton did present");
    
}

#pragma mark == 夜间模式(我这里的夜间模式都可以优化,用的笨办法,但是在baseViewController里面不好使)此处存疑 ============================
- (void)changeToNight:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    self.isNight = [[userInfo objectForKey:@"status"] boolValue];
    if (self.isNight) {
        self.view.alpha = 0.9;
        self.view.backgroundColor = [UIColor blackColor];
    }
}

- (void)changeToDay:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    self.isNight = [[userInfo objectForKey:@"statusDay"] boolValue];
    if (!self.isNight) {
        self.view.alpha = 1;
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)showTabBar{
    
    self.milkHuntsmanTabBar.hidden = NO;
    self.dcButton.hidden = NO;
}

- (void)hiddenTabBar{
    
    self.milkHuntsmanTabBar.hidden = YES;
    self.dcButton.hidden = YES;
}
-(void)backAction:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(UIButton *)setChildButton:(UIButton *)button
                      title:(NSString *)title
                      image:(NSString *)image
                   selected:(NSString *)selected{
    
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:selected] forState:(UIControlStateSelected)];
  //偏移量,参数: 上,左,下,右
    [button setImageEdgeInsets:(UIEdgeInsetsMake(0, 0, 15, 0))];
    //title 的偏移量
    [button setTitleEdgeInsets:(UIEdgeInsetsMake(0, -60, -30, 0))];
    //字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    // 设置按钮普通状态标题颜色
    [button setTitleColor:[UIColor colorWithRed:0.33 green:0.21 blue:0.15 alpha:1.00] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:38.0/255 green:217.0/255 blue:165.0/255 alpha:1] forState:UIControlStateSelected];
    return button;
}
//实现代理的方法
-(void)milkHuntsmanItemDidClicked:(MilkHuntsmanTabBar *)tabBar{
    self.selectedIndex = tabBar.currentSelected;
    
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
