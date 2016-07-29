//
//  RecommendModel.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseModel.h"

@interface RecommendModel : BaseModel

@property (nonatomic, copy) NSString *img_url;
@property (nonatomic, copy) NSArray *hunter_list;
@property (nonatomic, copy) NSString *avatar_l;
@property (nonatomic, copy) NSString *comment_text;
@property (nonatomic, copy) NSDictionary *goodcomment_rate;
@property (nonatomic, copy) NSString *recommendID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *product_id;
@property (nonatomic, copy) NSString *product_title;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *address_display_type;
@property (nonatomic, copy) NSString *date_str;
@property (nonatomic, copy) NSString *discount_price;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *is_liked;
@property (nonatomic, copy) NSString *is_new;
@property (nonatomic, copy) NSString *like_count;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *sold_count;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *stock;
@property (nonatomic, copy) NSArray *tab_list;
@property (nonatomic, copy) NSString *title_page;
@property (nonatomic, copy) NSString *cover_image;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *depart_place;
@property (nonatomic, copy) NSString *icon_type;
@property (nonatomic, copy) NSString *market_price;
@property (nonatomic, copy) NSString *min_price;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *trip_id;
@property (nonatomic, copy) NSDictionary *user;

@end
