//
//  MessageTableViewCell.m
//  MilkHuntsman
//
//  Created by Hx on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)awakeFromNib {
    self.imageVIew.layer.masksToBounds = YES;
    self.imageVIew.layer.cornerRadius = self.imageVIew.bounds.size.width/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
