//
//  Annotation.h
//  进阶-map-地图
//
//  Created by fengchunyan on 16/6/17.
//  Copyright © 2016年 李鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

//标记位置（大头针）
@interface Annotation : NSObject<MKAnnotation>
@property(nonatomic,assign)CLLocationCoordinate2D coordinate;//经纬度
@property(nonatomic,copy)NSString *title;//标题
@property(nonatomic,copy)NSString *subtitle;//子标题
#pragma mark--图片属性
@property(nonatomic,strong)UIImage *image;
//大头针图标
@property(nonatomic,strong)UIImage *icon;

@property(nonatomic,strong)NSString *detail;
@property(nonatomic,strong)UIImage *rate;

@end
