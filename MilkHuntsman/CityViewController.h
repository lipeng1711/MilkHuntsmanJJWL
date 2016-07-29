//
//  CityViewController.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^passValueBlock)(NSString *);

@interface CityViewController : UIViewController

@property (nonatomic, copy) passValueBlock passString;

@end
