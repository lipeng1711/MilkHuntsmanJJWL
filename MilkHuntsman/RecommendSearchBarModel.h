//
//  RecommendSearchBarModel.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"

@interface RecommendSearchBarModel : BaseModel

@property (nonatomic, copy) NSString *publish_date;
@property (nonatomic, copy) NSString *next_start;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSArray *product_list;
@property (nonatomic, copy) NSArray *tab_list;
@property (nonatomic, copy) NSString *product_id;
@property (nonatomic, assign) BOOL is_liked;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *title_page;
@property (nonatomic, copy) NSString *is_new;
@property (nonatomic, copy) NSString *discount_price;
@property (nonatomic, copy) NSString *like_count;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSDictionary *user;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *avatar_l;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address_display_type;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *sold_count;
@property (nonatomic, copy) NSString *date_str;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *stock;

@end
