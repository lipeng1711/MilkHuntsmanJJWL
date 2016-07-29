//
//  FouthTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"
@interface FouthTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView *bigView;
@property (strong, nonatomic) UIImageView *bigImageView;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UIView *litileView;
@property (strong, nonatomic) UIImageView *litileImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) NSMutableArray *fouthArray;
@property (nonatomic, strong) RecommendModel *recommendmodel;

@end
