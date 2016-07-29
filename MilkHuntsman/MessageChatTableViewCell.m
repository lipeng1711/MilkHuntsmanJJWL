//
//  MessageChatTableViewCell.m
//  MilkHuntsman
//
//  Created by Hx on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "MessageChatTableViewCell.h"

@implementation MessageChatTableViewCell

- (void)awakeFromNib {
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = self.userImageView.bounds.size.width/2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
