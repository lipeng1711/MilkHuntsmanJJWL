//
//  LPSegmentIndicator.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPSegmentIndicator : UIView
@property (nonatomic) CGFloat cornerRadius;

@property (nonatomic) CGFloat borderWidth;
@property (nonatomic) UIColor *borderColor;

@property (nonatomic) BOOL drawsGradientBackground;
@property (nonatomic) UIColor *gradientTopColor;
@property (nonatomic) UIColor *gradientBottomColor;
@end
