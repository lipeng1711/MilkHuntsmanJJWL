//
//  FindModel.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FindModel.h"


@implementation FindModel

//因为无法直接给model赋值,所以重写set方法,给对应的model赋值
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


//解析数据实现方法
+ (NSMutableArray *)parseFindWithDic:(NSDictionary *)dic{
    NSMutableArray *returnFindArray = [NSMutableArray array];
    NSArray *array = dic[@"data"][@"feeds"];
    for (NSDictionary *tempDic in array) {
        FindModel *model = [FindModel new];
        [model setValuesForKeysWithDictionary:tempDic];
        [returnFindArray addObject:model];
    }
    return returnFindArray;
}



@end
