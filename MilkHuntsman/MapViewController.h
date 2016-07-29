//
//  MapViewController.h
//  进阶-map-地图
//
//  Created by fengchunyan on 16/6/17.
//  Copyright © 2016年 李鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController

@property (nonatomic, assign) CGFloat longitude;//经度
@property (nonatomic, assign) CGFloat latitude;//维度
@property (nonatomic, strong) NSString *mapCityName;

@end
