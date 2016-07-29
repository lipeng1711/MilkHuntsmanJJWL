//
//  commentUserModel.h
//  MilkHuntsman
//
//  Created by npc on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"

@interface commentUserModel : BaseModel

//用户名对应的id
@property (nonatomic, copy) NSString *ID;
//用户头像(小)
@property (nonatomic, copy) NSString *avatar_s;
//用户名
@property (nonatomic, copy) NSString *name;
//用户头像(大)
@property (nonatomic, copy) NSString *avatar_l;
//用户头像(中)
@property (nonatomic, copy) NSString *avatar_m;




@end
