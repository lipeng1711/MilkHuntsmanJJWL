//
//  CoreSingleHandle.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/29.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreSingleHandle : NSObject
//重写初始化方法
+ (instancetype)shareCoreSingleHandle;

//在这里直接给数组初始化
@property (nonatomic, strong) NSMutableArray *dataArray;

//在这里初始化数组,使用get方法,如果使用懒加载只走一次,不能实时更新.
- (NSArray *)getData;

@end
