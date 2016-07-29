//
//  CoredataModel+CoreDataProperties.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/29.
//  Copyright © 2016年 South Park. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CoredataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoredataModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *product_id;
@property (nullable, nonatomic, retain) NSString *price;
@property (nullable, nonatomic, retain) NSString *cover;

@end

NS_ASSUME_NONNULL_END
