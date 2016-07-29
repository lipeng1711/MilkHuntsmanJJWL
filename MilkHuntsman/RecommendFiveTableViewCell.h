//
//  RecommendFiveTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"
//设置代理实现点击tempView跳转页面
@protocol FirstFiveCellDelegate <NSObject>

- (void)firstFiveChangePageByIndext:(NSInteger)indext;

@end

@interface RecommendFiveTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *recommendImageView;
@property (nonatomic, strong) UILabel *recommendDescriptionLabel;
@property (nonatomic, strong) UILabel *recommendMoneyLabel;
@property (nonatomic, strong) UIScrollView *recommendScrollView;
@property (nonatomic, strong) RecommendModel *model;
@property (nonatomic, strong) UIView *tempView;
@property (nonatomic, assign)id<FirstFiveCellDelegate> firstFiveDelegate;
@property (nonatomic, strong) NSMutableArray *firstFiveArray;

@end
