//
//  enter.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "enter.h"
#import "MyRequestURL.h"
@implementation enter
- (void)loginRequestWithUsername:(NSString *)username
                        password:(NSString *)password
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure{
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    
    [request sendDataWithUrl:LoginRequest_Url parameters:@{@"userName":username,@"password":password} successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
