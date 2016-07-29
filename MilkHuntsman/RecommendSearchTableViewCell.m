//
//  RecommendSearchTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendSearchTableViewCell.h"

@implementation RecommendSearchTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.litileView.layer.cornerRadius = self.litileView.frame.size.width / 2;
    self.litileImageView.layer.cornerRadius = self.litileImageView.frame.size.width / 2;
    self.bigImageView.layer.cornerRadius = 5;
    self.litileImageView.layer.masksToBounds = YES;
    self.litileView.layer.masksToBounds = YES;
    self.bigImageView.layer.masksToBounds = YES;
    
    
}

- (void)setSearchBarModel:(RecommendSearchBarModel *)searchBarModel
{
    _searchBarModel = searchBarModel;
    [_bigImageView setImageWithURL:[NSURL URLWithString:_searchBarModel.title_page]];
    
    [_litileImageView setImageWithURL:[NSURL URLWithString:_searchBarModel.user[@"avatar_l"]]];
    _descroptionLabel.text = [NSString stringWithFormat:@"%@",_searchBarModel.title];
    _addressLabel.text = [NSString stringWithFormat:@"%@ · %@",_searchBarModel.address,_searchBarModel.distance];
    _priceLabel.text = [NSString stringWithFormat:@"¥%@",_searchBarModel.price];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
