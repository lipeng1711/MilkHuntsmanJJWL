//
//  CommentTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "CommentModel.h"
#import "StarsView.h"
#import "StarView.h"

@interface CommentTableViewCell ()

@property (nonatomic, strong) StarsView *starView;

@end

@implementation CommentTableViewCell


- (void)setModel:(CommentModel *)model{
    _model = model;
    
    [self.commentImageV setImageWithURL:[NSURL URLWithString:model.newuser.avatar_s]];
    
    self.userName.text = model.newuser.name;
    
    self.commentLabel.text = model.text;

    self.dateLabel.text = model.date_added;
    
   
#pragma mark ============== 星星的设置 ====================
    self.starView = [[StarsView alloc] initWithStarSize:CGSizeMake(20, 20) space:5 numberOfStar:5];

    self.starView.supportDecimal = YES;
//     self.starView.score = 3.7;
    self.starView.score = model.star;
    self.starView.frame = self.starView.bounds;
    
    [self.ratingView addSubview:self.starView];
    
}

//计算文本高度的方法
-(CGFloat)getHeight:(CommentModel *)model{
    //计算文本的高度。返回文本所占的一个矩形的大小。
    CGRect textRect = [model.text boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 25, 10000) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]} context:nil];
    //判断，如果文本只有一行的话直接返回cell自己的高度。
    if (textRect.size.height > self.contentView.frame.size.height) {
        return textRect.size.height + 25;
    }
    return self.contentView.frame.size.height ;
}


- (void)awakeFromNib {
    self.commentImageV.layer.masksToBounds = YES;
    self.commentImageV.layer.cornerRadius = self.commentImageV.bounds.size.width / 2.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
