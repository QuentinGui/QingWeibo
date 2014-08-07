//
//  NSString+GQ.m
//  QingWeibo
//
//  Created by guiqing on 8/7/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "NSString+GQ.h"

@implementation NSString (GQ)

-(NSString*)fileAppend:(NSString*)appned
{

    //1.得到文件拓展名
    NSString *ext = [self pathExtension];
    //2.删除拓展名
    NSString *imageName=[self stringByDeletingPathExtension];
    //3.拼接
    imageName=[imageName stringByAppendingString:appned];
    //4.加回拓展名
    return [imageName stringByAppendingString:ext];


}

@end
