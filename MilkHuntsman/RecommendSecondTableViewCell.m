//
//  RecommendSecondTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendSecondTableViewCell.h"

@implementation RecommendSecondTableViewCell

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
    _imageArr = [NSArray array];
    self.scrollView = [UIScrollView new];
    [self.contentView addSubview:self.scrollView];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //--------------------添加scrollView---------------
    NSInteger kWidth = WindownWidth * 0.8;
    NSInteger kHeight = WindowHeight * 0.4;
    self.scrollView.frame = CGRectMake(5, 0, WindownWidth, kHeight);
    self.scrollView.contentSize = CGSizeMake(kWidth * 6 + 6, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    
    for (int i = 0; i < 6; i ++) {
        self.tempView = [[UIView alloc] initWithFrame:CGRectMake(kWidth * i + 5, 5, kWidth - 5, kHeight)];
        self.tempView.layer.cornerRadius = 10;
        self.tempView.layer.masksToBounds = YES;
        self.tempView.backgroundColor = [UIColor whiteColor];
        [self.scrollView addSubview:self.tempView];
        self.scrollView.backgroundColor = [UIColor whiteColor];
        //-------------------在tempView上添加imageView-------------
        self.bigImageView = [UIImageView new];
        self.bigImageView.frame = CGRectMake(0, 0, kWidth - 5, kHeight - 100);
        self.litleImageView = [UIImageView new];
        self.litleImageView.frame = CGRectMake(self.bigImageView.center.x - 20, CGRectGetMaxY(self.bigImageView.frame) - 20, 40, 40);
        [self.tempView addSubview:self.bigImageView];
        [self.tempView addSubview:self.litleImageView];
        self.bigImageView.backgroundColor = [UIColor clearColor];
        self.litleImageView.backgroundColor = [UIColor clearColor];
        self.litleImageView.layer.cornerRadius = self.litleImageView.bounds.size.width / 2;
        self.litleImageView.layer.masksToBounds = YES;
        
        //------------------在tempView上添加两个label---------------
        self.titleLabel = [UILabel new];
        self.descriptionLabel = [UILabel new];
        self.titleLabel.frame = CGRectMake(30, CGRectGetMaxY(self.litleImageView.frame), kWidth - 60, 35);
        self.descriptionLabel.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), kWidth - 20, 35);
        self.descriptionLabel.numberOfLines = 0;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.descriptionLabel.backgroundColor = [UIColor clearColor];
        [self.tempView addSubview:self.titleLabel];
        [self.tempView addSubview:self.descriptionLabel];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.font = [UIFont systemFontOfSize:15.0];
        self.descriptionLabel.numberOfLines = 0;
        self.descriptionLabel.textColor = [UIColor lightGrayColor];
        
        
        //-----------------------赋值------------------------
        _imageArr = @[
                      @"http://photos.breadtrip.com/dashboard_tp_1459146605.210.336334441563.jpg?imageView/2/w/640/",
                      @"http://photos.breadtrip.com/dashboard_tp_1440385690.170.569257201295.jpg?imageView/2/w/640/",
                      @"http://photos.breadtrip.com/dashboard_tp_1458701611.70.245316087668.png?imageView/2/w/640/",
                      @"http://photos.breadtrip.com/dashboard_tp_1445053776.120.70296080625.jpg?imageView/2/w/640/",
                      @"http://photos.breadtrip.com/dashboard_tp_1458198143.330.246738028817.jpg?imageView/2/w/640/",
                      @"http://photos.breadtrip.com/dashboard_tp_1446003930.690.0152570145807.jpg?imageView/2/w/640/"
                      ];
        [self.bigImageView setImageWithURL:[NSURL URLWithString:_imageArr[i]]];
        [self.litleImageView setImageWithURL:[NSURL URLWithString:_secondArr[i][@"avatar_l"]]];
        self.titleLabel.text = _secondArr[i][@"name"];
        self.descriptionLabel.text = _secondArr[i][@"product_title"];
        
        
        //-----------------------每个tempView添加一个手势-----------------------
        self.tempView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.tempView  addGestureRecognizer:tapGesture];
        
        
    }
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender
{
    NSInteger indext = (sender.self.view.frame.origin.x - 5) / (sender.self.view.frame.size.width + 5);
    [self.secondDelegate secondChangePageByIndext:indext];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
