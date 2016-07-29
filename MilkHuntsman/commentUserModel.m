//
//  commentUserModel.m
//  MilkHuntsman
//
//  Created by npc on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "commentUserModel.h"

@implementation commentUserModel

//防止崩溃方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}






@end
