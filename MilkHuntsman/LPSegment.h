//
//  LPSegment.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LPSegment;
@interface LPSegment : UIView
@property (nonatomic) UILabel *titleLabel;

- (instancetype)initWithTitle:(NSString *)title;
@end
