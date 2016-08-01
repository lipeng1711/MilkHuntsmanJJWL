//
//  FamilyGroup.m
//  MyFamily
//
//  Created by fengchunyan on 15/7/2.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FamilyGroup.h"

@implementation FamilyGroup
-(id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(id)familyGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
