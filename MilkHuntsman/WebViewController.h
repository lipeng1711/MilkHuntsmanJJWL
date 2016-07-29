//
//  WebViewController.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseViewController.h"
#import "FindModel.h"
@interface WebViewController1 : BaseViewController

//传递动态ID,属性传值
@property (nonatomic, strong) NSString *passID;

@property (nonatomic, strong) FindModel *model;

@end
