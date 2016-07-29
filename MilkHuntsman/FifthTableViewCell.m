//
//  FifthTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/24.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FifthTableViewCell.h"

@implementation FifthTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllViews];
    }
    return self;
}
- (void)addAllViews
{
    self.backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bei.png"]];
    
    [self.contentView addSubview:self.backImageView];
    _backGroundView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.backImageView addSubview:_backGroundView];
    _backGroundView.backgroundColor = [UIColor clearColor];
    self.recommendScrollView = [UIScrollView new];
    [self.contentView addSubview:self.recommendScrollView];
    self.recommendScrollView.backgroundColor = [UIColor clearColor];
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button1 setTitle:@"本地生活" forState:(UIControlStateNormal)];
    [self.recommendScrollView addSubview:button1];
    UIButton *button2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button2 setTitle:@"线上活动" forState:(UIControlStateNormal)];
    [self.recommendScrollView addSubview:button2];
    UIButton *button3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button3 setTitle:@"美食" forState:(UIControlStateNormal)];
    [self.recommendScrollView addSubview:button3];
    UIButton *button4 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button4 setTitle:@"城市微旅行" forState:(UIControlStateNormal)];
    [self.recommendScrollView addSubview:button4];
    UIButton *button5 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button5 setTitle:@"经验分享" forState:(UIControlStateNormal)];
    [self.recommendScrollView addSubview:button5];
    UIButton *button6 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button6 setTitle:@"技能get" forState:(UIControlStateNormal)];
    [self.recommendScrollView addSubview:button6];
    [button1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button3 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button4 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button5 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button6 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    _btn1 = button1;
    _btn2 = button2;
    _btn3 = button3;
    _btn4 = button4;
    _btn5 = button5;
    _btn6 = button6;
    _btn1.backgroundColor = [UIColor whiteColor];
    _btn2.backgroundColor = [UIColor whiteColor];
    _btn3.backgroundColor = [UIColor whiteColor];
    _btn4.backgroundColor = [UIColor whiteColor];
    _btn5.backgroundColor = [UIColor whiteColor];
    _btn6.backgroundColor = [UIColor whiteColor];
    _btn1.layer.cornerRadius = 10;
    _btn2.layer.cornerRadius = 10;
    _btn3.layer.cornerRadius = 10;
    _btn4.layer.cornerRadius = 10;
    _btn5.layer.cornerRadius = 10;
    _btn6.layer.cornerRadius = 10;
    _btn1.layer.masksToBounds = YES;
    _btn2.layer.masksToBounds = YES;
    _btn3.layer.masksToBounds = YES;
    _btn4.layer.masksToBounds = YES;
    _btn5.layer.masksToBounds = YES;
    _btn6.layer.masksToBounds = YES;
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];

}

- (void)timerAction:(NSTimer *)timer
{
    
    if (_isAction) {
        [self beginAnimation];
        _isAction = NO;
    }else{
        [self endAnimation];
        _isAction = YES;
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.recommendScrollView.frame = CGRectMake(0, 0, WindownWidth, WindowHeight * 0.25);
    self.recommendScrollView.contentSize = CGSizeMake(WindownWidth * 1.25, 0);
    self.backImageView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    self.backGroundView.frame = self.backImageView.frame;
    _btn1.frame = CGRectMake(50, 20, 80, 50);
    _btn2.frame = CGRectMake(180, 20, 80, 50);
    _btn3.frame = CGRectMake(350, 20, 80, 50);
    _btn4.frame = CGRectMake(50, 120, 80, 50);
    _btn5.frame = CGRectMake(180, 120, 80, 50);
    _btn6.frame = CGRectMake(350, 120, 80, 50);
    [_btn1 sizeToFit];
    [_btn2 sizeToFit];
    [_btn3 sizeToFit];
    [_btn4 sizeToFit];
    [_btn5 sizeToFit];
    [_btn6 sizeToFit];
    
}

- (void)beginAnimation
{
    //开始设置UIView动画
    [UIView beginAnimations:nil context:nil];
    
    //设置动画播放时长(2s)
    [UIView setAnimationDuration:2];
    
    _btn1.frame = CGRectMake(80, 60, 80, 50);
    _btn2.frame = CGRectMake(180, 60, 80, 50);
    _btn3.frame = CGRectMake(400, 70, 80, 50);
    _btn4.frame = CGRectMake(20, 100, 80, 50);
    _btn5.frame = CGRectMake(150, 100, 80, 50);
    _btn6.frame = CGRectMake(300, 70, 80, 50);
    [_btn1 sizeToFit];
    [_btn2 sizeToFit];
    [_btn3 sizeToFit];
    [_btn4 sizeToFit];
    [_btn5 sizeToFit];
    [_btn6 sizeToFit];
    _btn1.alpha = 1;
    _btn2.alpha = 1;
    _btn3.alpha = 1;
    _btn4.alpha = 1;
    _btn5.alpha = 1;
    _btn6.alpha = 1;
    //开始播放动画
    [UIView  commitAnimations];
    
}

- (void)endAnimation
{
    //开始设置UIView动画
    [UIView beginAnimations:nil context:nil];
    
    //设置动画播放时长(2s)
    [UIView setAnimationDuration:2];
    
    _btn1.frame = CGRectMake(50, 20, 80, 50);
    _btn2.frame = CGRectMake(180, 20, 80, 50);
    _btn3.frame = CGRectMake(350, 20, 80, 50);
    _btn4.frame = CGRectMake(50, 120, 80, 50);
    _btn5.frame = CGRectMake(180, 120, 80, 50);
    _btn6.frame = CGRectMake(350, 120, 80, 50);
    [_btn1 sizeToFit];
    [_btn2 sizeToFit];
    [_btn3 sizeToFit];
    [_btn4 sizeToFit];
    [_btn5 sizeToFit];
    [_btn6 sizeToFit];
    _btn1.alpha = 0.3;
    _btn2.alpha = 0.3;
    _btn3.alpha = 0.3;
    _btn4.alpha = 0.3;
    _btn5.alpha = 0.3;
    _btn6.alpha = 0.3;
    //开始播放动画
    [UIView  commitAnimations];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
