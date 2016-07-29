//
//  RegisterRequest.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest : NSObject
- (void)registerWithName:(NSString *)name
                password:(NSString *)password
                  avator:(UIImage *)image
                 success:(SuccessResponse)success
                 failure:(FailureResponse)failure;
@end
