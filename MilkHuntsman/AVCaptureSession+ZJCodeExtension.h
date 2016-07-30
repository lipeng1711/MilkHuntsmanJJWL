//
//  AVCaptureSession+ZJCodeExtension.h
//  MilkHuntsman
//
//  Created by lanou3g on 16/7/30.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

/**
 *  读取二维码分类
 */

@interface AVCaptureSession (ZJCodeExtension)
/**
 *  读取二维码
 *
 *  @param delegate 输出代理
 *
 *  @return session
 */
+ (instancetype)readQRCodeWithMetadataObjectsDelegate:(id<AVCaptureMetadataOutputObjectsDelegate>)delegate;

/**
 *  读取条形码
 *
 *  @param delegate 输出代理
 *
 *  @return session
 */
+ (instancetype)readBarCodeWithMetadataObjectsDelegate:(id<AVCaptureMetadataOutputObjectsDelegate>)delegate;


@end
