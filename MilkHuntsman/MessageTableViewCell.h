//
//  MessageTableViewCell.h
//  MilkHuntsman
//
//  Created by Hx on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MessageTableViewCell_ID @"MessageTableViewCell_ID"

@interface MessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
