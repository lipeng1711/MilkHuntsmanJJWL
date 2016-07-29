//
//  HomePageModel.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    

}


#pragma mark ========== 解析trips数据 ==============
//解析数据
+ (NSMutableArray *)parseHomePageWithDic:(NSDictionary *)dic{
    NSMutableArray *returnHomePageArray = [NSMutableArray array];
    
    for (NSDictionary *tempDic in [dic[@"data"][@"trips"]objectForKey:@"data"]) {
        HomePageModel *model = [HomePageModel new];
        [model setValuesForKeysWithDictionary:tempDic];
        [returnHomePageArray addObject:model];
    }
    return returnHomePageArray;
}






@end
