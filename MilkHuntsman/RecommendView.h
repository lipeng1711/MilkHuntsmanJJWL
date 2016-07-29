//
//  RecommendView.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
//设置代理实现点击imageView跳转页面
@protocol ImageViewDelegate <NSObject>

- (void)changePageByIndext:(NSInteger)indext;

@end
@interface RecommendView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *recommendScrollView;
@property (nonatomic, strong) UIPageControl *recommendPageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, assign)id<ImageViewDelegate> imageViewDelegate;

@end
