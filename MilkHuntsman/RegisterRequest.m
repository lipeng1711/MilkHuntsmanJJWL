//
//  RegisterRequest.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RegisterRequest.h"
#import "MyRequestURL.h"
@implementation RegisterRequest
- (void)registerWithName:(NSString *)name
                password:(NSString *)password
                  avator:(UIImage *)image
                 success:(SuccessResponse)success
                 failure:(FailureResponse)failure{
    NSDictionary *parameter = @{@"userName":name,@"password":password};
    NetWorkRequest *request = [[NetWorkRequest alloc] init];
    [request sendImageWithUrl:RegisterRequest_Url parameter:parameter image:image successResponse:^(NSDictionary *dic) {
        success(dic);
        
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}
@end
