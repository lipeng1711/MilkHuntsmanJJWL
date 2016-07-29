//
//  CollectTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/21.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CollectTableViewCell.h"

@implementation CollectTableViewCell





- (void)awakeFromNib {
    
    self.collectImageV.layer.masksToBounds = YES;
    self.collectImageV.layer.cornerRadius = self.collectImageV.bounds.size.width / 10.0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
