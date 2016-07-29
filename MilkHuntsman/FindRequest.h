//
//  FindRequest.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindRequest : NSObject

//发现类 请求
- (void)findRequestWithParameter:(NSDictionary *)parameterDic
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure;

//单例方法
ZJSingletonH(FindRequest);



@end
