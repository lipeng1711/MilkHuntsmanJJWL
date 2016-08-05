//
//  LPRecommendView.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/8/3.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "LPRecommendView.h"

@implementation LPRecommendView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}
-(void)addAllViews
{
    
    self.searchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.searchBtn.frame = CGRectMake(10, 0, WindownWidth - 80, 44);
    [self.searchBtn setTitle:@"搜索活动关键字、商圈、分类" forState:(UIControlStateNormal)];
    self.searchBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
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

    
    
    NSArray *imagesURLStrings = @[
                                  @"http://photos.breadtrip.com/covers_2016_07_11_384a17b54e2ceda1b7d34c6f695e0f32.jpg?imageView/2/w/960/",
                                  @"http://photos.breadtrip.com/covers_2016_07_16_37a1cf9b73c40e0ef66c8befc09993d4.jpg?imageView/2/w/960/",
                                  @"http://photos.breadtrip.com/covers_2016_07_12_26fba97023f3b458989df223e2105f76.png",
                                  @"http://photos.breadtrip.com/covers_2016_07_19_66b4b1f3c831ffe973f0dd3e28bfbaac.png?imageView/2/w/960/",
                                  @"http://photos.breadtrip.com/covers_2016_06_15_30253350df414dc860d652e1e641be32.jpg?imageView/2/w/960/"];
    _cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 44, WindownWidth, 150) delegate:nil placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    _cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //    cycleScrollView2.titlesGroup = titles;
    _cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
//    self.recommendTableView.tableHeaderView = cycleScrollView2;
    [self addSubview:_cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
