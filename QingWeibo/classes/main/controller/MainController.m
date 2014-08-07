//
//  MainController.m
//  QingWeibo
//
//  Created by guiqing on 8/5/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "MainController.h"
#import "Dock.h"

#define kDockHeight 44

@interface MainController ()<DockDelegate>

@end

@implementation MainController



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor =[UIColor redColor];
    
    //1 add dock
    Dock *dock = [[Dock alloc]init];
    dock.frame =CGRectMake(0, self.view.frame.size.height-kDockHeight, self.view.frame.size.width, kDockHeight);
    
    dock.delegate=self;
    
    [self.view addSubview:dock];
    
    //2 add something to dock
    [dock addItemWithIcon:@"tabbar_home.png" title:@"首页"];
    [dock addItemWithIcon:@"tabbar_message_center.png" title:@"消息"];
    [dock addItemWithIcon:@"tabbar_profile.png" title:@"我"];
    [dock addItemWithIcon:@"tabbar_discover.png" title:@"广场"];
    [dock addItemWithIcon:@"tabbar_more.png" title:@"更多"];
    
    //3 add other things to controller
    
    
    
    
    
}

#pragma mark dock的代理方法

-(void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to
{


}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
