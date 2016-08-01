//
//  ZJGuidePageHUD.h
//  引导页
//
//  Created by lanou3g on 16/7/31.
//  Copyright © 2016年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BOOLFORKEY @"zjGuidePage"

@interface ZJGuidePageHUD : UIView

/**
 *  ZJGuidePageHUD
 *
 *  @param frame      位置大小
 *  @param imageArray 引导页图片数组
 *  @param isHidden   开始体验按钮是否隐藏(YES:隐藏-引导页完成自动进入APP首页; NO:不隐藏-引导页完成点击开始体验按钮进入APP主页)
 *
 *  @return ZJGuidePageHUD对象
 */
- (instancetype)zj_initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray buttonIsHidden:(BOOL)isHidden;

@end
