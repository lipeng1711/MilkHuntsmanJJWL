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

@end
