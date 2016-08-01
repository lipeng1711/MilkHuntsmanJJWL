//
//  ImageFromTableViewCell.h
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/30.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ImageFromTableViewCell_Identify @"ImageFromTableViewCell_Identify"
@interface ImageFromTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIImageView *fromImage;

@end
