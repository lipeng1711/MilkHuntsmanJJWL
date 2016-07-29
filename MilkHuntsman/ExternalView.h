//
//  ExternalView.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/16.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExternalView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *xternalTableView;
@property (nonatomic, strong) NSMutableArray *xternalCityArr;

@end
