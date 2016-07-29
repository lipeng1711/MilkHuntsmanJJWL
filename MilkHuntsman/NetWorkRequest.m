//
//  NetWorkRequest.m
//  UI_项目01_NiceProduct
//
//  Created by fengchunyan on 16/6/27.
//  Copyright © 2016年 张健. All rights reserved.
//

#import "NetWorkRequest.h"
//成功回调
typedef void(^SuccessResponse)(NSDictionary *);
//失败回调
typedef void(^FailureResponse)(NSError *error);

@implementation NetWorkRequest

//Get请求
-(void)requestWithUrl:(NSString *)url
           parameters:(NSDictionary *)parameterDic
      successResponse:(SuccessResponse)success
      failureResponse:(FailureResponse)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  //第三个网址URL是HTML格式,而这里默认是Json格式,所以加一句
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:url parameters:parameterDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//Post请求
- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parameterDic
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:parameterDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

//注册上传图片
- (void)sendImageWithUrl:(NSString *)url
               parameter:(NSDictionary *)parameterDic
                   image:(UIImage *)uploadImage
         successResponse:(SuccessResponse)success
         failureResponse:(FailureResponse)failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:parameterDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
     //多点上传
      //UIImageJPEGRepresentation: 压缩图片
        //mimeType:后台上传图片所使用的类型
        [formData appendPartWithFileData:UIImageJPEGRepresentation(uploadImage, 0.5) name:@"avatar" fileName:@"avatar.jpg" mimeType:@"application/octet-stream"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}












@end
