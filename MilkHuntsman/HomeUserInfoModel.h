//
//  HomeUserInfoModel.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"

@interface HomeUserInfoModel : BaseModel

#pragma mark =========== 以下是user_info的数据 ================
//用户名字
@property (nonatomic, copy) NSString *name;
//用户图片
@property (nonatomic, copy) NSString *avatar_m;
//背景图片
@property (nonatomic, copy) NSString *cover;
//粉丝数量
@property (nonatomic, copy) NSString *followers_count;
//关注数量
@property (nonatomic, copy) NSString *points;


#pragma mark =========== 解析user_Info 数据 =============
//解析user_info数据 (因为是一个头部视图,所以这里传一个model就可以了)
+ (HomeUserInfoModel *)parseHomePageHeadDic:(NSDictionary *)dic;


@end
