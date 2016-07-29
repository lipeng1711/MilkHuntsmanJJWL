//
//  CityModel.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/20.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"

@interface CityModel : BaseModel

@property (nonatomic, copy) NSString *hot_city_list;
@property (nonatomic, copy) NSString *all_city_list;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *children;

@end
