//
//  RecommendSearchBarModel.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendSearchBarModel.h"

@implementation RecommendSearchBarModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _userID = value;
    }
}
@end
