//
//  UIImage+Addtion.m
//  QingWeibo
//
//  Created by guiqing on 8/6/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "UIImage+Addtion.h"
#import "NSString+GQ.h"

@implementation UIImage (Addtion)

#pragma mark 加载全屏图片
+(UIImage*)fullScreenImage:(NSString*)imageName
{
    //判断是否是iphone5,对文件名进行处理
    //if ([UIScreen mainScreen].bounds.size.height==568) {
    //以上判断是否是ip5是非常常用的,那么也要抽取出来,只有一行代码的抽取,我们用宏
    //在 other文件夹里创建一个 公共宏 头文件
     if (isIphone5) {

         imageName = [imageName fileAppend:@"-568h@2x."];
    }
    
        //UIImage *reImage = [UIImage imageNamed:image];
       // return reImage;
    return  [self imageNamed:imageName];
}


#pragma mark 自由拉伸的图片
+(UIImage*)resizedImage:(NSString*)imgName{

    UIImage *image= [UIImage imageNamed:imgName];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];

    return image;

}



@end
