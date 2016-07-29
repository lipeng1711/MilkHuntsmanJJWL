//
//  MessageChatTableViewCell.h
//  MilkHuntsman
//
//  Created by Hx on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MessageChatTableViewCell_ID @"MessageChatTableViewCell_ID"
@interface MessageChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
