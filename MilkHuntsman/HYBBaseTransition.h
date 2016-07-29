//
//  HYBBaseTransitionAnimation.h
//  HYBTransitionAnimations
//
//  Created by fengchunyan on 16/3/29.
//  Copyright © 2016年 lipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * GITHUB           : https://github.com/CoderJackyHuang/HYBControllerTransitions
 * Chinese Document : http://www.henishuo.com/transition-chinese-document/
 * Author Blog      : http://www.henishuo.com/
 * Email            : huangyibiao520@163.com
 *
 * Please give me a feed back when there is something wrong, or you need a special effec.
 */


@class HYBBaseTransition;

/**
 *	@author huangyibiao
 *
 *	The block version of protocol, just see:
 *
 *  - (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
 *
 *	@param presented	The controller will be presented
 *	@param presenting	The controller to present the presented controller
 *	@param source	    The source controller
 *  @param transition The object which implement UIViewControllerTransitioningDelegate protocol.
 *                    Just strongly cast it to the subclass type which was called.
 *
 *  @Note For more information, @see UIViewControllerTransitioningDelegate
 */
typedef void(^HYBTransitionPresented)(UIViewController *presented,
                                      UIViewController *presenting,
                                      UIViewController *source,
                                      HYBBaseTransition *transition);

typedef void(^HYBTransitionDismiss)(UIViewController *dismissed, HYBBaseTransition *transition);

typedef void(^HYBTransitionPush)(UIViewController *fromVC,
                                 UIViewController *toVC,
                                 HYBBaseTransition *transition);
// The same to the push
typedef HYBTransitionPush HYBTransitionPop;


typedef NS_ENUM(NSUInteger, HYBTransitionMode) {
  kHYBTransitionDismiss, // Dismiss
  kHYBTransitionPresent, // Present
  kHYBTransitionPush,    // Push
  kHYBTransitionPop      // Pop
};


@interface HYBBaseTransition : NSObject <
UIViewControllerAnimatedTransitioning, // This is the required protocol.
UIViewControllerTransitioningDelegate, // for present and dismiss transition
UINavigationControllerDelegate // For push and pop transition
>

@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, assign) HYBTransitionMode transitionMode;

@property (nonatomic, copy) HYBTransitionPresented animationPresentedCallback;

@property (nonatomic, copy) HYBTransitionDismiss animationDismissCallback;


@property (nonatomic, copy) HYBTransitionPush animationPushedCallback;

@property (nonatomic, copy) HYBTransitionPop animationPopedCallback;

@property (nonatomic, assign) BOOL animatedWithSpring;

@property (nonatomic, assign) CGFloat initialSpringVelocity;

@property (nonatomic, assign) CGFloat damp;

- (instancetype)initWithPresented:(HYBTransitionPresented)presentedCallback
                        dismissed:(HYBTransitionDismiss)dismissCallback;

- (instancetype)initWithPushed:(HYBTransitionPush)pushCallback
                         poped:(HYBTransitionPop)popCallback;

- (UIView *)toView:(id<UIViewControllerContextTransitioning>)transitionContext ;
- (UIView *)fromView:(id<UIViewControllerContextTransitioning>)transitionContext ;

@end
