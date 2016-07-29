//
//  FromTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FromTableViewCell.h"

@implementation FromTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(CGFloat)getHeight:(NSString *)text
               font:(CGFloat)font{
    self.myLabel.text =text;
    self.myLabel.textAlignment = NSTextAlignmentLeft;
    self.myLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.myLabel.font =[UIFont systemFontOfSize:font];
    
    [self.myLabel sizeToFit];
    CGFloat height =self.myLabel.frame.size.height;
    [self.myLabel setNumberOfLines:0];
    return height;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end