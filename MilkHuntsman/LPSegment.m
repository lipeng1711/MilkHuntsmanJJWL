//
//  LPSegment.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "LPSegment.h"
static CGFloat const kMinimumSegmentWidth = 68.0f;
@implementation LPSegment
- (instancetype)initWithTitle:(NSString *)title {
    self = [self initWithFrame:CGRectZero];
    if (self) {
        self.titleLabel.text = title;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.titleLabel = [[UILabel alloc] initWithFrame:self.frame];
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize sizeThatFits = [self.titleLabel sizeThatFits:size];
    return CGSizeMake(MAX(sizeThatFits.width * 1.4f, kMinimumSegmentWidth), sizeThatFits.height);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
