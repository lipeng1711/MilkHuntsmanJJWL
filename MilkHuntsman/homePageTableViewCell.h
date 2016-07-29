//
//  homePageTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageModel.h"

@interface homePageTableViewCell : UITableViewCell
//背景图片
@property (weak, nonatomic) IBOutlet UIImageView *bakgroundIV;
//标题文字
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//浏览次数
@property (weak, nonatomic) IBOutlet UILabel *lookLabel;
//喜欢次数
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
//评论个数
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (nonatomic, strong) HomePageModel *homePageModel;

- (void)setHomePageModel:(HomePageModel *)homePageModel;


@end
