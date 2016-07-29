//
//  RecommendRequest.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendRequest : NSObject
+(instancetype)shareRecommendRequest;
- (void)recommendRequestWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestAddressWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
//button-----
-(void)recommendRequestButtonWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
@end
