//
//  ThirdTableViewCell.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ThirdCellDelegate <NSObject>

- (void)thirdChangePageBySelected:(NSInteger)selectedIndex;

@end

@interface ThirdTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *litileImageView;
@property (nonatomic, strong) UIImageView *bigImageView;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *activityLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *tempView;
@property (nonatomic, assign)id<ThirdCellDelegate> thirdDelegate;
@property (nonatomic, strong) NSMutableArray *thirdArr;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, assign) int currentIndext;

@end
