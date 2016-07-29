//
//  FindModel.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"


@interface FindModel : BaseModel

//活动类型
@property (nonatomic, copy) NSString *category;
//活动对应的ID
@property (nonatomic, copy) NSString *product_id;
//活动发布者
@property (nonatomic, strong) NSDictionary * product;
//不同类型的spot,和product对应的model
@property (nonatomic, strong) NSDictionary * spot;
//活动点赞的用户
@property (nonatomic, strong) NSMutableArray * liked_users;
//活动评论个数
@property (nonatomic, copy) NSString *comment_count;
//活动点赞的个数 
@property (nonatomic, copy) NSString *liked_count;
//活动发起者用户
@property (nonatomic, strong) NSDictionary *user;
//ID?
@property (nonatomic, copy) NSString *spot_id;
//活动发布时间
@property (nonatomic, copy) NSString *date_added;
//活动名称
@property (nonatomic, copy) NSString *product_title;



//解析数据
+ (NSMutableArray *)parseFindWithDic:(NSDictionary *)dic;


















@end
