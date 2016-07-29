//
//  CommentTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
#define CommentTableViewCell_Identify @"CommentTableViewCell_Identify"
@interface CommentTableViewCell : UITableViewCell

//评论用户头像
@property (weak, nonatomic) IBOutlet UIImageView *commentImageV;
//评论的用户名
@property (weak, nonatomic) IBOutlet UILabel *userName;
//评论的文字
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
//评价的星级
@property (weak, nonatomic) IBOutlet UIView *ratingView;
//评价日期
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) CommentModel *model;

- (void)setModel:(CommentModel *)model;

-(CGFloat)getHeight:(CommentModel *)model;


@end
