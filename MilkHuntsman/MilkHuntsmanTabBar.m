//
//  MilkHuntsmanTabBar.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/6/28.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "MilkHuntsmanTabBar.h"




@implementation MilkHuntsmanTabBar


-(id)initWithItems:(NSArray *)items
             frame:(CGRect)frame{
    if (self = [super init]) {
        self.frame = frame;
        for (int i = 0; i < items.count; i++) {
            UIButton *btn = (UIButton *)items[i];
            CGFloat width = self.bounds.size.width / items.count;
            CGFloat height = self.bounds.size.height;
            btn.frame = CGRectMake(i * width + 10, 0, width, height);
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:btn];
        }
     //在初始化中给属性赋值
        //当前tabbar显示第一个
        self.currentSelected = 0;
       //当前选中的item
        self.currentSelectedItem = items[0];
       //返回所有的4个items
        self.allItems = items;
    }
    return self;
}

-(void)btnClicked:(UIButton *)btn{
    
    self.currentSelectedItem = btn;
    for (int i = 0; i < self.allItems.count; i++) {
        UIButton *tempBtn = (UIButton *)self.allItems[i];
        if (btn == tempBtn) {
            self.currentSelected = i;
            tempBtn.selected = YES;
        }
        else{
            tempBtn.selected = NO;
        }
    }
    //代理
    if (_MilkHuntsmanDelegate) {
        [_MilkHuntsmanDelegate milkHuntsmanItemDidClicked:self];
    }
}



@end
