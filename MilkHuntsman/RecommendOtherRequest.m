//
//  RecommendOtherRequest.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendOtherRequest.h"
static RecommendOtherRequest *request = nil;
@implementation RecommendOtherRequest
+(instancetype)shareRecommendOtherRequest{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[RecommendOtherRequest alloc] init];
    });
    return request;
}

//搜索解析
- (void)recommendRequestListOneWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarOne_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListTwoWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarTwo_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListThreeWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarThree_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListFourWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarFour_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListFiveWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarFive_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListSixWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarSix_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListSevenWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarSeven_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListEightWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarEight_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

- (void)recommendRequestListNineWithParameter:(NSDictionary *)parameter success:(SuccessResponse)success failure:(FailureResponse)failure
{
    NetWorkRequest *request = [NetWorkRequest new];
    [request requestWithUrl:RecommendSearchBarNine_Url parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
}

@end
