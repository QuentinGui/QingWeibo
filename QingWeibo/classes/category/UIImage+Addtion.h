//
//  UIImage+Addtion.h
//  QingWeibo
//
//  Created by guiqing on 8/6/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addtion)
#pragma mark 加载全屏图片
+(UIImage*)fullScreenImage:(NSString*)imageName;

#pragma mark 自由拉伸的图片
+(UIImage*)resizedImage:(NSString*)imgName;

@end
