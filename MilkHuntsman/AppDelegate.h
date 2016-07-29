//
//  AppDelegate.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/13.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UMSocial.h> //友盟社会化组件
#import <UMSocialSinaSSOHandler.h> //新浪微博
#import <UMSocialQQHandler.h> //QQ
#import <UMSocialWechatHandler.h> //微信

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,assign)BOOL hasLogined;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

