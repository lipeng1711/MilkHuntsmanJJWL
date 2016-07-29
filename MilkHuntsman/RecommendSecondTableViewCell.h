//
//  RecommendSecondTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SecondCellDelegate <NSObject>

- (void)secondChangePageByIndext:(NSInteger)index;

@end

@interface RecommendSecondTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *bigImageView;
@property (nonatomic, strong) UIImageView *litleImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIView *tempView;
@property (nonatomic, assign)id<SecondCellDelegate> secondDelegate;
@property (nonatomic, strong) NSMutableArray *secondArr;
@property (nonatomic, strong) NSArray *imageArr;

@end
