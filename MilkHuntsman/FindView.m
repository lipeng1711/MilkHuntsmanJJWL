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
