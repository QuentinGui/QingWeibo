//
//  Dock.h
//  QingWeibo
//
//  Created by guiqing on 8/7/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Dock;
//协议要用类名开头,好知道谁的代理
@protocol DockDelegate <NSObject>
@optional
-(void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to;
@end




@interface Dock : UIView
//添加一个选项卡
-(void)addItemWithIcon:(NSString*) icon title:(NSString*) title;


@property (nonatomic,weak) id<DockDelegate>delegate;
@end
