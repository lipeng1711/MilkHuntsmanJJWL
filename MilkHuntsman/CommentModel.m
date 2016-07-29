//
//  CommentModel.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"user"]) {
        commentUserModel *model = [[commentUserModel alloc] init];
        [model setValuesForKeysWithDictionary:value];
        _newuser = model;
    }
}

//解析数据实现方法
+ (NSMutableArray *)parseCommentWithDic:(NSDictionary *)dic{
    NSMutableArray *returnCommentArray = [NSMutableArray array];
    for (NSDictionary *tempDic in dic[@"items"]) {
        CommentModel *model = [CommentModel new];
        [model setValuesForKeysWithDictionary:tempDic];
        [returnCommentArray addObject:model];
    }
    return returnCommentArray;
}






@end
