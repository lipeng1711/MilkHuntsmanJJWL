//
//  RecommendSearchTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendSearchBarModel.h"
#define RecommendSearchTableViewCell_indentify @"RecommendSearchTableViewCell_indentify"

@interface RecommendSearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@property (weak, nonatomic) IBOutlet UIView *litileView;
@property (weak, nonatomic) IBOutlet UIImageView *litileImageView;
@property (weak, nonatomic) IBOutlet UILabel *descroptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) RecommendSearchBarModel *searchBarModel;

@end
