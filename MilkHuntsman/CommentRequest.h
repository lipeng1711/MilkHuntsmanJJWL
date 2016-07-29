//
//  CommentRequest.h
//  MilkHuntsman
//
//  Created by npc on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentRequest : NSObject

//发现页面评论 请求
- (void)commentRequestWithParameter:(NSDictionary *)parameterDic
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure;

//单例方法
ZJSingletonH(CommentRequest);



@end
