//
//  HomePageRequest.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageRequest : NSObject

//个人用户界面 请求
- (void)homePageRequestWithParameter:(NSDictionary *)parameterDic
                            success:(SuccessResponse)success
                            failure:(FailureResponse)failure;

//单例方法
ZJSingletonH(HomePageRequest);



@end
