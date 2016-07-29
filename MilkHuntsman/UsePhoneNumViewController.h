//
//  UsePhoneNumViewController.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "BaseViewController.h"
#import "EMSDK.h"

@protocol dissmissTwo <NSObject>

- (void)dissmissTwo;

@end



@protocol loginIsError <NSObject>



-(void)passValueError:(EMError*)error;

@end


@interface UsePhoneNumViewController : BaseViewController

@property(nonatomic,weak)id<dissmissTwo> delegateTwo;
@property(nonatomic,weak)id<loginIsError>delegate;

@end
