//
//  MapViewController.m
//  进阶-map-地图
//
//  Created by fengchunyan on 16/6/17.
//  Copyright © 2016年 李鹏. All rights reserved.
//

#import "MapViewController.h"
#import "Annotation.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()<MKMapViewDelegate>
@property (nonatomic, strong)MKMapView *mapView;
@end

@implementation MapViewController
- (void)viewWillAppear:(BOOL)animated
{
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    [milk hiddenTabBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.mapView];
//    设置代理
    self.mapView.delegate = self;
    

    [self showByCity:self.mapCityName];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemCancel) target:self action:@selector(leftAction:)];
}
- (void)leftAction:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//城市
- (void)showByCity:(NSString *)cityName
{
    //创建编码对象
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    //判断是否为空
    if (cityName.length == 0 || [self.mapCityName isEqualToString:@"所有城市▶︎"]) {
        return;
    }
    [geocoder geocodeAddressString:cityName completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error != nil || placemarks.count == 0) {
            return ;
        }
        //创建placemark对象
        CLPlacemark *placemark=[placemarks firstObject];
        //赋值经度
        self.longitude = placemark.location.coordinate.longitude;
        //赋值纬度
        self.latitude = placemark.location.coordinate.latitude;
        //赋值详细地址
        [self addAnnotation];
    }];
}



//添加大头针的方法
-(void)addAnnotation{
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    Annotation *annotation = [[Annotation alloc] init];
    annotation.coordinate = location;

    annotation.image = [UIImage imageNamed:@"icon_pin_floating@2x.png"];
    annotation.icon = [UIImage imageNamed:@"icon_mark1.png"];
    [self.mapView addAnnotation:annotation];

    
//    长摁手势 长按添加大头针
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressClick:)];
    [self.view addGestureRecognizer:longPress];
    
}
#pragma mark -- 放置大头针
//长摁大头针时间
-(void)longPressClick:(UILongPressGestureRecognizer *)logPr{
//    判断只在长摁的起始点下放置大头针
    if (logPr.state) {
//        首先获取点
        CGPoint point = [logPr locationInView:self.mapView];
//        将一个点转换成经纬度坐标
        CLLocationCoordinate2D center = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
        MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc] init];
        pointAnnotation.coordinate = center;
        pointAnnotation.title = @"长摁";
        [self.mapView addAnnotation:pointAnnotation];
    }
    
    
}

#pragma mark --- 地图控件代理方法
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
//    由于当前位置的标注是一个大头针，所以需要判断，这个代理方法返回nil使用的是默认大头针视图
//    if ([annotation isKindOfClass:[CustomAnno class]]) {
//        CustomAnnotation *calloutView = [CustomAnnotation calloutViewWithMapView:mapView];
//        calloutView.annotation = annotation;
//        return calloutView;
//    }else{
//        return nil;
//    }
    return nil;
}

#pragma mark -- 选中大头针时触发
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
//    Annotation *annotation = view.annotation;
    
//    if ([view.annotation isKindOfClass:[Annotation class]]) {
//        CustomAnno *annotation1 = [[CustomAnno alloc] init];
//        annotation1.icon = annotation.icon;
//        annotation1.detail = annotation.title;
//        annotation1.rate = annotation.image;
//        annotation1.coordinate = view.annotation.coordinate;
//        [mapView addAnnotation:annotation1];
//    }
    
    
}

#pragma mark -- 地图控件代理方法
//更新用户位置，只要用户位置改变则会调用此方法
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
//    设置地图显示的范围
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.location.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
