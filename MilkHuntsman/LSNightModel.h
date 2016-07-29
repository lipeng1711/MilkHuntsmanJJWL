//
//  LSNightModel.h
//  夜间模式
//
//  Created by lanou3g on 16/7/25.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LSNightModel <NSObject>

@required

- (void)setToDayMode;
- (void)setToNightMode;

@end

@interface LSNightModel : NSObject

+ (instancetype)sharedNightMode;


/**
 *  @brief one step method for night mode
 *  供外部调用，获取当前夜间模式状态的一步调用方法。
 *  一般地，在设置夜间模式页面的ViewController调用该方法，该ViewController应该是观察者。添加观察者之后要在dealloc方法中对其进行移除！
 *  1.添加观察者用来观察系统发出的夜间模式和日间模式通知。
 *  2.获取当前夜间模式状态，并发出夜间模式状态的通知。
 *
 *  @param observer 观察者
 */
- (void)nightModeWithObserver:(id)observer;

/**
 *  @brief change the night mode between day mode and night mode, and return the bool value
 *  从本地配置文件中获取夜间模式的设置状态，并改变状态，发出通知，将改变后的配置写回本地。
 *
 *  @return the bool value isNight?
 */
- (BOOL)changeNightMode;

/**
 *  @brief get the state of night mode setting from local
 *  从本地配置文件中获取当前夜间模式的设置状态。
 *  @return the bool value isNight?
 */
- (BOOL)getNightModeState;

- (void)notificationForNightModelWithObserver:(id)observer;




@end
