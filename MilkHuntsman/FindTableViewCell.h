//
//  FindTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindModel.h"

#define FindTableViewCell_Identify @"FindTableViewCell_Identify"
//因为这个button要点击跳转，所以添加一个代理方法
@protocol passValueCommentBtnDelegate <NSObject>

- (void)commentBtnDelegate:(NSString *)string;

@end

@interface FindTableViewCell : UITableViewCell
//发现页面图片
@property (weak, nonatomic) IBOutlet UIImageView *findImageV;
//标题名字
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//活动的价格
@property (weak, nonatomic) IBOutlet UILabel *findPrice;
//距离描述和位置
@property (weak, nonatomic) IBOutlet UILabel *findDistance;
//活动详情描述
@property (weak, nonatomic) IBOutlet UILabel *findDetailLabel;
//评论数
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
//commentBtn的代理
@property (weak, nonatomic) id<passValueCommentBtnDelegate>btnDelegate;
//点赞的人数
@property (weak, nonatomic) IBOutlet UILabel *likeUsers;
//头像1
@property (weak, nonatomic) IBOutlet UIImageView *headIcon1;
//头像2
@property (weak, nonatomic) IBOutlet UIImageView *headIcon2;
//头像3
@property (weak, nonatomic) IBOutlet UIImageView *headIcon3;
//头像4
@property (weak, nonatomic) IBOutlet UIImageView *headIcon4;
//头像5
@property (weak, nonatomic) IBOutlet UIImageView *headIcon5;

@property (nonatomic, strong) FindModel *findModel;

@property (nonatomic, strong) NSString *tempStrID;














@end
