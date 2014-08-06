//
//  UIImage+Addtion.m
//  QingWeibo
//
//  Created by guiqing on 8/6/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "UIImage+Addtion.h"

@implementation UIImage (Addtion)

#pragma mark 加载全屏图片
+(UIImage*)fullScreenImage:(NSString*)imageName
{
    //判断是否是iphone5,对文件名进行处理
    //if ([UIScreen mainScreen].bounds.size.height==568) {
    //以上判断是否是ip5是非常常用的,那么也要抽取出来,只有一行代码的抽取,我们用宏
    //在 other文件夹里创建一个 公共宏 头文件
     if (isIphone5) {

        //1.得到文件拓展名
        NSString *ext = [imageName pathExtension];
        //2.删除拓展名
        imageName=[imageName stringByDeletingPathExtension];
        //3.拼接
        imageName=[imageName stringByAppendingString:@"-568h@2x."];
        //4.加回拓展名
        imageName =[imageName stringByAppendingString:ext];
    }
    
        //UIImage *reImage = [UIImage imageNamed:image];
       // return reImage;
    return  [self imageNamed:imageName];
}

@end
