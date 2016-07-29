//
//  HomePageRequest.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "HomePageRequest.h"

@implementation HomePageRequest

//个人用户界面 请求
- (void)homePageRequestWithParameter:(NSDictionary *)parameterDic
                             success:(SuccessResponse)success
                             failure:(FailureResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    NSString *ID = [parameterDic objectForKey:@"id"];
    [request requestWithUrl:UserRequestUrl(ID) parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}


//单例方法
ZJSingletonM(HomePageRequest);








@end
