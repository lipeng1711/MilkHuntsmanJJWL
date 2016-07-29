//
//  homePageTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "homePageTableViewCell.h"

@implementation homePageTableViewCell


- (void)setHomePageModel:(HomePageModel *)homePageModel{
    _homePageModel = homePageModel;
    
 //赋值
    [self.bakgroundIV setImageWithURL:[NSURL URLWithString: homePageModel.cover_image_default]];
    
    self.titleLabel.text = homePageModel.name;
    
    self.lookLabel.text = [NSString stringWithFormat:@"%@ 次浏览",homePageModel.view_count];
    
    self.likeLabel.text = [NSString stringWithFormat:@"%@ 喜欢",homePageModel.liked_count];
    
    self.commentLabel.text = [NSString stringWithFormat:@"%@ 评论",homePageModel.version];
    
}


- (void)awakeFromNib {
    
    self.bakgroundIV.layer.masksToBounds = YES;
    self.bakgroundIV.layer.cornerRadius = 10;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
