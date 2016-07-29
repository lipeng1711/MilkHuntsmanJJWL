//
//  CALayer+Additions.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CALayer+Additions.h"

@implementation CALayer (Additions)

- (void)setBorderUIColor:(UIColor *)color{
    
    self.borderColor = color.CGColor;
    
}

- (UIColor *)borderUIColor{
    
    return [UIColor colorWithCGColor:self.borderColor];
    
}

@end
