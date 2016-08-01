//
//  ShowImageView.h
//  FriendGroup
//
//  Created by Steven on 15/5/6.
//  Copyright © 2016年 South Park. All rights reserved.
//

//用来处理图片点击后放大的效果
#import <UIKit/UIKit.h>
typedef void(^didRemoveImage)(void);
@interface ShowImageView : UIView
@property (nonatomic,copy)didRemoveImage removeImg;
-(id)initWithFrame:(CGRect)frame byClickTag:(NSInteger)clickTag appendArray:(NSArray *)appendArray;
@end

