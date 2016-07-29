//
//  FouthTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FouthTableViewCell.h"

@implementation FouthTableViewCell

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
    self.bigView = [UIView new];
    self.bigImageView = [UIImageView new];
    self.litileImageView = [UIImageView new];
    self.litileView = [UIView new];
    self.addressLabel = [UILabel new];
    self.priceLabel = [UILabel new];
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.bigView];
    [self.bigView addSubview:self.bigImageView];
    [self.bigView addSubview:self.addressLabel];
    [self.bigView addSubview:self.priceLabel];
    [self.bigView addSubview:self.titleLabel];
    [self.bigImageView addSubview:self.litileView];
    [self.litileView addSubview:self.litileImageView];
    self.bigView.backgroundColor = [UIColor whiteColor];
    self.bigImageView.backgroundColor = [UIColor clearColor];
    self.litileImageView.backgroundColor = [UIColor clearColor];
    self.litileView.backgroundColor = [UIColor clearColor];
    self.addressLabel.backgroundColor = [UIColor clearColor];
    self.priceLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger kWidth = self.contentView.frame.size.width;
    NSInteger kHeight = self.contentView.frame.size.height;
    self.bigView.frame = CGRectMake(5, 5, kWidth - 10, kHeight - 5);
    self.bigImageView.frame = CGRectMake(0, 0, kWidth - 10, kHeight - 80);
    self.litileView.frame = CGRectMake(kWidth - 100, CGRectGetMaxY(self.bigImageView.frame) - 20, 40, 40);
    self.litileImageView.frame = CGRectMake(0, 0, self.litileView.frame.size.width, self.litileView.frame.size.height);
    self.titleLabel.frame = CGRectMake(5, CGRectGetMaxY(self.bigImageView.frame), kWidth - 130, 35);
    self.addressLabel.frame = CGRectMake(5, CGRectGetMaxY(self.titleLabel.frame), kWidth - 90, 35);
    self.priceLabel.frame = CGRectMake(kWidth - 75, CGRectGetMaxY(self.titleLabel.frame), 55, 35);
    self.litileView.layer.cornerRadius = self.litileView.bounds.size.width/ 2;
    self.priceLabel.tintColor = [UIColor redColor];
    self.litileView.layer.masksToBounds = YES;
    
}
//--------------------赋值--------------------
- (void)setRecommendmodel:(RecommendModel *)recommendmodel
{
        _recommendmodel = recommendmodel;
        [_bigImageView setImageWithURL:[NSURL URLWithString:_recommendmodel.title_page]];
        [_litileImageView setImageWithURL:[NSURL URLWithString:_recommendmodel.user[@"avatar_l"]]];
        _titleLabel.text = [NSString stringWithFormat:@"%@",_recommendmodel.title];
        _priceLabel.text = [NSString stringWithFormat:@"¥%@",_recommendmodel.price];
        _addressLabel.text = [NSString stringWithFormat:@"%@ · %@人喜欢",_recommendmodel.address,_recommendmodel.like_count];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
