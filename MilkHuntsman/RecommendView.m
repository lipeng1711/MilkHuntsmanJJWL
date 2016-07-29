//
//  RecommendView.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendView.h"

@implementation RecommendView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews
{
    NSArray *array = @[
                       @"http://photos.breadtrip.com/covers_2016_07_11_384a17b54e2ceda1b7d34c6f695e0f32.jpg?imageView/2/w/960/",
                       @"http://photos.breadtrip.com/covers_2016_07_16_37a1cf9b73c40e0ef66c8befc09993d4.jpg?imageView/2/w/960/",
                       @"http://photos.breadtrip.com/covers_2016_07_12_26fba97023f3b458989df223e2105f76.png",
                       @"http://photos.breadtrip.com/covers_2016_07_19_66b4b1f3c831ffe973f0dd3e28bfbaac.png?imageView/2/w/960/",
                       @"http://photos.breadtrip.com/covers_2016_06_15_30253350df414dc860d652e1e641be32.jpg?imageView/2/w/960/"];
    
    //---------------添加两个button--------------------
    
    self.searchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.searchBtn.frame = CGRectMake(10, 0, WindownWidth - 80, 44);
    [self.searchBtn setTitle:@"搜索活动关键字、商圈、分类" forState:(UIControlStateNormal)];
    [self.searchBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
    self.searchBtn.layer.shadowOffset = CGSizeMake(0, 5);
    self.searchBtn.layer.shadowRadius = 5.0;
    self.searchBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    self.searchBtn.layer.shadowOpacity = 0.9;
    [self addSubview:self.searchBtn];
    self.searchBtn.layer.cornerRadius = 20;
    self.searchBtn.layer.masksToBounds = YES;
    self.searchBtn.backgroundColor = [UIColor whiteColor];
    self.addressBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.addressBtn.frame = CGRectMake(CGRectGetMaxX(self.searchBtn.frame) + 5, 0, 60, 44);
    [self.addressBtn setImage:[UIImage imageNamed:@"icon_paopao_waterdrop_streetscape@2x.png"] forState:(UIControlStateNormal)];
    [self addSubview:self.addressBtn];
    self.addressBtn.backgroundColor = [UIColor whiteColor];

    //---------------添加轮播图---------------------------
    self.recommendScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, WindownWidth, 150)];
    self.recommendScrollView.contentSize = CGSizeMake(WindownWidth * 5, 0);
    self.recommendScrollView.pagingEnabled = YES;
    NSInteger kHeight = self.recommendScrollView.frame.size.height;
    for (int i = 0; i < array.count; i ++) {
        UIImageView *tempImageV = [UIImageView new];
        [tempImageV setImageWithURL:[NSURL URLWithString:array[i]]];
        tempImageV.frame = CGRectMake(WindownWidth * i, 0, WindownWidth, kHeight);
        [self.recommendScrollView addSubview:tempImageV];
        
//-----------------------每个tempView添加一个手势-----------------------
        tempImageV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [tempImageV  addGestureRecognizer:tapGesture];
        
        
    }
    [self addSubview:self.recommendScrollView];
    
    
//------------------添加pageControl-------------------
    self.recommendPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(WindownWidth * 0.38, kHeight + 10, WindownWidth * 0.3, 30)];
    self.recommendPageControl.numberOfPages = array.count;
    [self addSubview:self.recommendPageControl];
    self.recommendPageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.recommendPageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.recommendPageControl addTarget:self action:@selector(pageControllAction:) forControlEvents:(UIControlEventValueChanged)];
    self.recommendScrollView.delegate = self;
    [self setupTimer];
}

- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [self.imageViewDelegate changePageByIndext:self.recommendPageControl.currentPage];
}

#pragma mark -- pageControll 的触发方法(轮播)
int a = 0;
- (void)timerAction
{
    a++;
    if (a == 5) {
        a = 0;
    }
    [self.recommendScrollView setContentOffset:CGPointMake(WindownWidth * a, 0) animated:YES];
    [self.recommendPageControl setCurrentPage:a];
}
- (void)pageControllAction:(UIPageControl *)sender
{
    
    [self.recommendScrollView setContentOffset:CGPointMake(WindownWidth * sender.currentPage, 0) animated:YES];
    a = (int)sender.currentPage;
}
//添加定时器
- (void)setupTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
}

//开始滑动移除定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self invalidateTimer];
    
}
//停止滑动开启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.recommendPageControl.currentPage = self.recommendScrollView.contentOffset.x / WindownWidth;
    a = (int)self.recommendPageControl.currentPage;
    [self setupTimer];
}
//移除定时器
- (void)invalidateTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
//当前页面对应当前currentPage
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.recommendPageControl.currentPage = self.recommendScrollView.contentOffset.x / WindownWidth;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
