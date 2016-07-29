//
//  FindRequest.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FindRequest.h"

@implementation FindRequest

//解析方法
- (void)findRequestWithParameter:(NSDictionary *)parameterDic
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request requestWithUrl:FindRequest_Url parameters:parameterDic successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

//单例实现方法
ZJSingletonM(FindRequest);

@end
