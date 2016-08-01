//
//  CoreSingleHandle.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/29.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CoreSingleHandle.h"
#import "coreManager.h"

@implementation CoreSingleHandle

static CoreSingleHandle *handle = nil;

+ (instancetype)shareCoreSingleHandle{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [[CoreSingleHandle alloc] init];
    });
    return handle;
}

-(NSArray *)getData{
    coreManager *manager = [coreManager new];
    NSArray *tempArray = [manager selectObjectContext];
    _dataArray = [NSMutableArray arrayWithArray:tempArray];
    return _dataArray;
}


@end
