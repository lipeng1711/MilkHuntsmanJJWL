//
//  coreManager.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/29.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"
@class CoredataModel;
@interface coreManager : BaseModel

//添加数据库
- (void)addObjectContext:(NSString *)title
                  string:(NSString *)ID
                priceStr:(NSString *)price
                coverStr:(NSString *)cover;

//删除数据库
- (void)deleteObjectContext:(CoredataModel *)model;

//搜索数据库
- (NSArray *)selectObjectContext;

//在搜索数据库的时候进行（条件约束）
- (BOOL)selectObjextContext:(NSString *)string;

@end
