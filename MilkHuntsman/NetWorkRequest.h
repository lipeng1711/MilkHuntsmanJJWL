//
//  NetWorkRequest.h
//  UI_项目01_NiceProduct
//
//  Created by fengchunyan on 16/6/27.
//  Copyright © 2016年 张健. All rights reserved.
//

#import "BaseRequest.h"

//成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);
//失败回调
typedef void(^FailureResponse)(NSError *error);


//继承于基类，这是一个工具类
@interface NetWorkRequest : BaseRequest
/*
 请求数据:
 @url:请求数据的url
 @parametersDic：请求的参数
 @success：成功回调的block
 @failure：失败回调的block
 */

- (void)requestWithUrl:(NSString *)url
           parameters:(NSDictionary *)parameterDic
      successResponse:(SuccessResponse)success
      failureResponse:(FailureResponse)failure;


- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse)failure;


- (void)sendImageWithUrl:(NSString *)url
               parameter:(NSDictionary *)parameterDic
                   image:(UIImage *)uploadImage
         successResponse:(SuccessResponse)success
         failureResponse:(FailureResponse)failure;








@end
