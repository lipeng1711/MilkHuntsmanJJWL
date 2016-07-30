//
//  RecommendTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendTableViewCell.h"
#import "RecommendRequest.h"
@implementation RecommendTableViewCell

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
    
    self.recommendScrollView = [UIScrollView new];
    [self.contentView addSubview:self.recommendScrollView];
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //--------------------添加scrollView---------------
    NSInteger kWidth = WindownWidth * 0.4;
    NSInteger kHeight = WindowHeight * 0.3;
    self.recommendScrollView.frame = CGRectMake(5, 0, WindownWidth, kHeight);
    self.recommendScrollView.contentSize = CGSizeMake(kWidth * 6 + 6, 0);
    
    self.recommendScrollView.showsHorizontalScrollIndicator = NO;
    
    
    for (int i = 0; i < 6; i ++) {
        self.tempView = [[UIView alloc] initWithFrame:CGRectMake(kWidth * i + 5, 5, kWidth - 5, kHeight)];
        self.tempView.layer.cornerRadius = 10;
        self.tempView.layer.masksToBounds = YES;
        self.tempView.backgroundColor = [UIColor whiteColor];
        [self.recommendScrollView addSubview:self.tempView];
        self.recommendScrollView.backgroundColor = [UIColor whiteColor];
        //-------------------在tempView上添加imageView-------------
        self.recommendImageView = [UIImageView new];
        self.recommendImageView.frame = CGRectMake(0, 0, kWidth - 5, kHeight - 80);
        self.recommendImageView.layer.cornerRadius = 5;
        self.recommendImageView.layer.masksToBounds = YES;
        self.recommendImageView.backgroundColor = [UIColor clearColor];
        [self.tempView addSubview:self.recommendImageView];
        
        
        //------------------在tempView上添加两个label---------------
        self.recommendDescriptionLabel = [UILabel new];
        self.recommendMoneyLabel = [UILabel new];
        self.recommendDescriptionLabel.frame = CGRectMake(0, CGRectGetMaxY(self.recommendImageView.frame), kWidth - 5, kHeight - CGRectGetHeight(self.recommendImageView.frame) - 30);
        self.recommendMoneyLabel.frame = CGRectMake(CGRectGetMidX(self.recommendDescriptionLabel.frame), CGRectGetMaxY(self.recommendDescriptionLabel.frame), kWidth / 2, kHeight - CGRectGetHeight(self.recommendImageView.frame) - CGRectGetHeight(self.recommendDescriptionLabel.frame));
        self.recommendDescriptionLabel.backgroundColor = [UIColor clearColor];
        self.recommendMoneyLabel.font = [UIFont systemFontOfSize:15.0];
        self.recommendMoneyLabel.backgroundColor = [UIColor clearColor];
        [self.tempView addSubview:self.recommendDescriptionLabel];
        [self.tempView addSubview:self.recommendMoneyLabel];
        
        
        //--------------------赋值---------------------
        
        
        
        [self.recommendImageView setImageWithURL:[NSURL URLWithString:_dataArr[0][i][@"title_page"]]];
        _recommendDescriptionLabel.text = _dataArr[0][i][@"title"];
        _recommendMoneyLabel.text = [NSString stringWithFormat:@"¥%@",_dataArr[0][i][@"price"]];
        self.recommendMoneyLabel.textAlignment = NSTextAlignmentCenter;
        self.recommendDescriptionLabel.font = [UIFont systemFontOfSize:14.0];
        self.recommendDescriptionLabel.numberOfLines = 0;
        self.recommendMoneyLabel.textColor = [UIColor redColor];
        
        //-----------------------每个tempView添加一个手势-----------------------
        self.tempView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.tempView  addGestureRecognizer:tapGesture];
        
        
    }
    
}
//手势的触发方法
- (void)tapAction:(UITapGestureRecognizer *)sender
{
    
    //    NSLog(@"View = %@",sender.self.view);
    NSInteger indext = (sender.self.view.frame.origin.x - 5) / (sender.self.view.frame.size.width + 5);
    [self.firstDelegate firstChangePageByIndext:indext];
    
    
}
#pragma mark -- 赋值
- (void)setModel:(RecommendModel *)model
{
    
    if (_model != model) {
        _model = nil;
        _model = model;
        
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
