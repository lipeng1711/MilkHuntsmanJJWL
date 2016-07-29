//
//  CommentRequest.m
//  MilkHuntsman
//
//  Created by npc on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CommentRequest.h"

@implementation CommentRequest

- (void)commentRequestWithParameter:(NSDictionary *)parameterDic
                            success:(SuccessResponse)success
                            failure:(FailureResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    NSString *ID = [parameterDic objectForKey:@"id"];
    [request requestWithUrl:CommentRequest_Url(ID) parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
    
}

//单例方法
ZJSingletonM(CommentRequest);

@end
