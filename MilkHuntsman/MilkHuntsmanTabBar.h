//
//  MilkHuntsmanTabBar.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/6/28.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MilkHuntsmanTabBar;
@protocol MilkHuntsmanTabBarDelegate <NSObject>

- (void)milkHuntsmanItemDidClicked:(MilkHuntsmanTabBar *)tabBar;

@end


@interface MilkHuntsmanTabBar : UITabBar

//当前选中的tabBar的下标(tabBar中的0,1,2,3)
@property (nonatomic, assign) int currentSelected;
//当前选中的item
@property (nonatomic, strong) UIButton *currentSelectedItem;
//tabBar上面所有的item
@property (nonatomic, strong) NSArray *allItems;
//初始化方法:根据items初始化items
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame;

@property (nonatomic, weak) id<MilkHuntsmanTabBarDelegate>MilkHuntsmanDelegate;


@end
