//
//  CommentModel.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"
#import "commentUserModel.h"

@interface CommentModel : BaseModel

//得分
@property (nonatomic, copy) NSString *score;
//星级
@property (nonatomic, assign) CGFloat star;
//用户名(如果是和系统的user写一样的话,他会自动匹配,相当于直接往model里面添加了字典,会炸)
@property (nonatomic, strong) commentUserModel *newuser;
//评论时间
@property (nonatomic, copy) NSString *date_added;
//评论文字
@property (nonatomic, copy) NSString *text;
//活动评论标题
@property (nonatomic, copy) NSString *product_title;
//是否公开
@property (nonatomic, assign) BOOL *is_public;
//ID
@property (nonatomic, copy) NSString *product_id;

//解析数据                                 
+ (NSMutableArray *)parseCommentWithDic:(NSDictionary *)dic;










@end
