//
//  FindView.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindModel.h"
@class FindView;
//通过设置代理,传递每一个手势点击的id,这样没有bug
@protocol passValueDelegate <NSObject>

- (void)passTapGesture:(UITapGestureRecognizer *)tap view:(FindView *)findView;

@end

@interface FindView : UIView
//头像
@property (nonatomic, strong) UIImageView *headImageV;
//用户名字
@property (nonatomic, strong) UILabel *userName;
//发布活动
@property (nonatomic, strong) UILabel *label;
//发布时间
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) FindModel *model;

@property(weak,nonatomic)id<passValueDelegate> delegate;

@end
