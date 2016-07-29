//
//  InternalView.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/16.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendRequest.h"
@interface InternalView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *internalTableView;
@property (nonatomic, strong) NSMutableArray *internalCityArr;

@end
