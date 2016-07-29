//
//  CityViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CityViewController.h"
#import "LPSegmentedControl.h"
#import "InternalView.h"
#import "ExternalView.h"

@interface CityViewController ()<UIScrollViewDelegate,UITableViewDelegate>

@property (nonatomic, strong) UIButton *recommendBackBtn;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) InternalView *internalView;
@property (nonatomic, strong) ExternalView *externalView;
@property LPSegmentedControl *segmentedControl;
@property UIView *visibleExampleView;
@property NSArray *exampleViews;

@end

@implementation CityViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [GiFHUD show];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [GiFHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    //初始化scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, WindownWidth, self.view.frame.size.height - 150)];
    self.scrollView.backgroundColor = [UIColor cyanColor];
    self.scrollView.contentSize = CGSizeMake(WindownWidth * 2, 0);
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self;
    [self addAllViews];

}

- (void)addAllViews
{
    self.recommendBackBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.recommendBackBtn.frame = CGRectMake(self.view.center.x - 100, WindowHeight - 50, 200, 50);
    [self.recommendBackBtn setTitle:@"❌" forState:(UIControlStateNormal)];
    [self.recommendBackBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.recommendBackBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.recommendBackBtn];

    
#pragma mark --添加两个tableview
    _internalView = [[InternalView alloc] initWithFrame:CGRectMake(0, 0, WindownWidth, self.view.frame.size.height - 90)];
    [self.scrollView addSubview:_internalView];
    _externalView = [[ExternalView alloc] initWithFrame:CGRectMake(WindownWidth, 0, WindownWidth, self.view.frame.size.height - 90)];
    [self.scrollView addSubview:_externalView];
    self.externalView.xternalTableView.delegate = self;
    self.internalView.internalTableView.delegate = self;
    [self addSegment];
    
}

- (void)addSegment
{
    
    LPSegmentedControl *segmentedControl = [[LPSegmentedControl alloc] initWithItems:@[@"国内",@"国外"]];
    segmentedControl.titleTextColor = [UIColor blackColor];
    segmentedControl.selectedTitleTextColor = [UIColor cyanColor];
    segmentedControl.selectedTitleFont = [UIFont systemFontOfSize:16.0f];
    segmentedControl.segmentIndicatorBackgroundColor = [UIColor whiteColor];
    segmentedControl.borderWidth = 0.0f;
    segmentedControl.segmentIndicatorBorderWidth = 0.0f;
    segmentedControl.segmentIndicatorInset = 1.0f;
    segmentedControl.segmentIndicatorBorderColor = self.view.backgroundColor;
    [segmentedControl sizeToFit];
    
    segmentedControl.cornerRadius = CGRectGetHeight(segmentedControl.frame) / 2.0f;
    segmentedControl.center = CGPointMake(self.view.center.x, self.view.center.y + 30.0f);
    segmentedControl.frame = CGRectMake(self.view.center.x - 80, 50, 160, 30);
    [self.view addSubview:segmentedControl];
    self.segmentedControl = segmentedControl;
    [segmentedControl addTarget:self action:@selector(valueChanged:) forControlEvents:(UIControlEventValueChanged)];
    self.exampleViews = @[self.view];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
#pragma mark -- SegmentedControl 点击方法
- (void)valueChanged:(UISegmentedControl *)sender
{
    [self.scrollView setContentOffset:CGPointMake(WindownWidth * sender.selectedSegmentIndex, 0)];
    
}
#pragma mark -- 停止滑动时方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.segmentedControl.selectedSegmentIndex = self.scrollView.contentOffset.x/WindownWidth;
}

- (void)segmentSelected
{
    UIView *exampleViewToShow = self.exampleViews[self.segmentedControl.selectedSegmentIndex];
    if (self.visibleExampleView == exampleViewToShow) {
        return;
    }
    
    self.visibleExampleView.hidden = YES;
    exampleViewToShow.hidden = NO;
    self.visibleExampleView = exampleViewToShow;
}

- (void)buttonClicked:(UIButton *)button
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
#pragma mark -- tableView跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        weakSelf.passString([tableView cellForRowAtIndexPath:indexPath].textLabel.text);
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
