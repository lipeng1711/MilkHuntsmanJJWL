//
//  ImageFromTableViewCell.m
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/30.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "ImageFromTableViewCell.h"

@implementation ImageFromTableViewCell

- (void)awakeFromNib {
    NSString *headImage = [JJZshare shareheadImage].headImage;
    NSData *imageData = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"imageName:%@",headImage]];
    self.headImage.image = [UIImage imageWithData:imageData];
    
    self.headImage.layer.masksToBounds = YES;
    
    self.headImage.layer.cornerRadius = self.headImage.bounds.size.width / 2.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
