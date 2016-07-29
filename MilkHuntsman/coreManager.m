//
//  coreManager.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/29.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "coreManager.h"
#import "AppDelegate.h"
#import "CoredataModel.h"

@interface coreManager ()

//objectContext告诉连接器我现在要去查询哪个文件,我们现在就可以通过AppDele里边的context获取所有的文件
@property (nonatomic, strong) NSManagedObjectContext *objectContext;

@end


@implementation coreManager
//懒加载数据库
- (NSManagedObjectContext *)objectContext{
    if (_objectContext == nil) {
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        _objectContext = app.managedObjectContext;  //获取managedObjectConext
    }
    return _objectContext;
}

//添加数据库
- (void)addObjectContext:(NSString *)title
                  string:(NSString *)ID
                priceStr:(NSString *)price
                coverStr:(NSString *)cover{
    //获取要往哪里添加对象
    CoredataModel *model = [NSEntityDescription insertNewObjectForEntityForName:@"CoredataModel" inManagedObjectContext:self.objectContext];
    
    model.title = title;
    model.product_id = ID;
    model.price = price;
    model.cover = cover;
    
    NSError *error = nil;
    //保存
    if ([self.objectContext save:&error]) {
        
    }else{
        NSLog(@"添加数据库error = %@",error);
    }
}


//删除数据库
- (void)deleteObjectContext:(CoredataModel *)model{
    [self.objectContext deleteObject:model];
    
    NSError *error = nil;
    //保存
    [self.objectContext save:&error];
}

//搜索数据库
- (NSArray *)selectObjectContext{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"CoredataModel"];
    NSArray *arr = [self.objectContext executeFetchRequest:request error:nil];
    NSLog(@"搜索数据库arr = %@",arr);
    return arr;
}

//在搜索数据库的时候进行(条件约束)
- (BOOL)selectObjextContext:(NSString *)string{
    NSArray *array = [self selectObjectContext];
    
    for (CoredataModel *model in array) {
        if ([model.title isEqualToString:string]) {
            return YES;
        }
    }
    NSLog(@"coredata返回no");
    return NO;
}

@end
