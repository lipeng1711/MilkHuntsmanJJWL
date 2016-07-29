//
//  CollectTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/21.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CollectTableViewCell_Identify @"CollectTableViewCell_Identify"
@interface CollectTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *collectImageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


@end
