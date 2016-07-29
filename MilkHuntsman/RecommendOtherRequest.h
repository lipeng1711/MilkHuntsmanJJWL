//
//  RecommendOtherRequest.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendOtherRequest : NSObject
+(instancetype)shareRecommendOtherRequest;
- (void)recommendRequestListOneWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListTwoWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListThreeWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListFourWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListFiveWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListSixWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListSevenWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListEightWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;
- (void)recommendRequestListNineWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure;

@end
