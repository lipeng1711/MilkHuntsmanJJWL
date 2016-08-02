//
//  FindView.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FindView.h"


@implementation FindView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setModel:(FindModel *)model{
    if (_model != model) {
        _model = nil;
        _model = model;
    }
    [_headImageV setImageWithURL:[NSURL URLWithString:model.user[@"avatar_s"]]];
    _userName.text = model.user[@"username"];
    _timeLabel.text = model.date_added;
    if ([model.category isEqualToString:@"share_product"]) {
        _label.text = @"分享活动";
    }else if([model.category isEqualToString:@"spot"]){
       _label.text = @"分享故事";
    }else{
        _label.text = @"发布活动";
    }
    //给头像添加点击事件手势
    _headImageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [_headImageV addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(clickAction:)];
}

//代理方法,传递每一个手势点击的id
- (void)clickAction:(UITapGestureRecognizer *)tap{
    if (_delegate && [_delegate respondsToSelector:@selector(passTapGesture:view:)]) {
        [_delegate passTapGesture:tap view:self];
    }
}


- (void)addAllViews{
    
    self.headImageV = [[UIImageView alloc] initWithFrame:CGRectMake(15, 13, 43, 43)];
    self.headImageV.layer.masksToBounds = YES;
    self.headImageV.layer.cornerRadius = self.headImageV.bounds.size.width / 2.0;
    [self addSubview:self.headImageV];

    self.userName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headImageV.frame)+10, CGRectGetMinY(_headImageV.frame), CGRectGetWidth(_headImageV.frame)+ 60, CGRectGetHeight(_headImageV.frame))];
    self.userName.numberOfLines = 0;
    self.userName.textColor = [UIColor blackColor];
    self.userName.font = [UIFont boldSystemFontOfSize:17];
    [self addSubview:self.userName];
 
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_userName.frame)+10, CGRectGetMinY(_userName.frame), CGRectGetWidth(_userName.frame), CGRectGetHeight(_userName.frame))];
    self.label.numberOfLines = 0;
    self.label.textColor = [UIColor grayColor];
    [self addSubview:self.label];

    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(335, 13, CGRectGetWidth(_label.frame), CGRectGetHeight(_label.frame))];
    self.timeLabel.numberOfLines = 0;
    self.timeLabel.textColor = [UIColor grayColor];
    [self addSubview:self.timeLabel];

}




@end
