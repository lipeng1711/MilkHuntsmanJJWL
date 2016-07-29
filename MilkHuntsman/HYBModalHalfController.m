//
//  HYBModalHalfController.m
//  HYBTransitionAnimations
//
//  Created by fengchunyan on 16/3/30.
//  Copyright © 2016年 lipeng. All rights reserved.
//

#import "HYBModalHalfController.h"
#import "HYBModalHalfDetailController.h"
#import "HYBModalTransition.h"

@interface HYBModalHalfController ()

@property (nonatomic, strong) HYBModalTransition *transition;

@end

@implementation HYBModalHalfController

- (void)viewDidLoad {
  [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

    
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"来吧" style:(UIBarButtonItemStylePlain) target:self action:@selector(onPresent)];
    
}

- (void)onPresent {
  HYBModalHalfDetailController *vc = [[HYBModalHalfDetailController alloc] init];
  
  self.transition = [[HYBModalTransition alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
    HYBModalTransition *modal = (HYBModalTransition *)transition;
    modal.scale = (CGPoint){0.9, 0.9};
    
    // If you don't specify, it will use default value
//    modal.presentedHeight = 350.0;
    
    // If you don't want to, set to YES or do no set.
    modal.shouldDismissOnTap = YES;
    
    // Default is NO, if set to YES, it will use spring animation.
    modal.animatedWithSpring = YES;
    
    // Default is YES. including navigation bar when take snapshots.
    // When has navigation bar, if set to NO, it looks not so good.
//    modal.scapshotIncludingNavigationBar = NO;
  } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
    // do nothing
    transition.transitionMode = kHYBTransitionDismiss;
  }];
  
  vc.transitioningDelegate = self.transition;
  [self presentViewController:vc animated:YES completion:NULL];
}

@end
