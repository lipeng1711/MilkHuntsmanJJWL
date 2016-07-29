//
//  HomePageModel.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"

@interface HomePageModel : BaseModel

#pragma mark =========== 以下是trips的数据 =====================
//故事背景图片
@property (nonatomic, copy) NSString *cover_image_default;
//故事标题文字
@property (nonatomic, copy) NSString *name;
//浏览次数
@property (nonatomic, copy) NSString *view_count;
//喜欢次数
@property (nonatomic, copy) NSString *liked_count;
//评论个数
@property (nonatomic, copy) NSString *version;



//解析trips数据
+ (NSMutableArray *)parseHomePageWithDic:(NSDictionary *)dic;






@end
