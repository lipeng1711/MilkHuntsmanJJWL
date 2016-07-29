//
//  RootViewController.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/6/28.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MilkHuntsmanTabBar.h"
@interface RootViewController : UITabBarController

@property(nonatomic,strong)MilkHuntsmanTabBar *milkTabBar;
- (void)showTabBar;
- (void)hiddenTabBar;

@property (nonatomic, strong) MilkHuntsmanTabBar *milkHuntsmanTabBar;

@end
