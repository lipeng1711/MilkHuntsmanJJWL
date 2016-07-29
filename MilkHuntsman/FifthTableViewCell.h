//
//  FifthTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/24.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

@interface FifthTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *recommendScrollView;
@property (nonatomic, strong) NSMutableArray *fifthArray;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;
@property (nonatomic, strong) UIButton *btn4;
@property (nonatomic, strong) UIButton *btn5;
@property (nonatomic, strong) UIButton *btn6;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL isAction;
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIView *backGroundView;

@end
