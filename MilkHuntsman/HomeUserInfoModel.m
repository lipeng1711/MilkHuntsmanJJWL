//
//  HomeUserInfoModel.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "HomeUserInfoModel.h"

@implementation HomeUserInfoModel


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

+ (HomeUserInfoModel *)parseHomePageHeadDic:(NSDictionary *)dic{
   
    HomeUserInfoModel *model = [HomeUserInfoModel new];
    [model setValuesForKeysWithDictionary:dic[@"data"][@"user_info"]];
    
    return model;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _name];
}

@end
