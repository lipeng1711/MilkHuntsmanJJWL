//
//  JJZshare.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJZshare : NSObject

@property (nonatomic, strong) UIImage *image;

@property(nonatomic,strong)UIImage *changeImage;

@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *integral;

@property(nonatomic,strong)NSString *headImage;

JJZSingletonH(headImage);

@end
