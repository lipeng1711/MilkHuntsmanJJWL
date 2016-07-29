//
//  homePageViewController.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseViewController.h"
#import "HomePageModel.h"
#import "HomeUserInfoModel.h"


@interface homePageViewController : BaseViewController
//用户头像
@property (weak, nonatomic) IBOutlet UIImageView *userImageV;
//用户粉丝
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;
//用户关注
@property (weak, nonatomic) IBOutlet UILabel *attentionLabel;
//用户名
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
//背景图片
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageV;

@property (nonatomic, strong) NSString *passValueID;

@property (nonatomic, strong) HomeUserInfoModel *userModel;



@end
