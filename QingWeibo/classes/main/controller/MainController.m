//
//  MainController.m
//  QingWeibo
//
//  Created by guiqing on 8/5/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "MainController.h"
#import "Dock.h"
#import "MoreController.h"
#import "HomeController.h"
#import "GQNavigationController.h"
#import "MeController.h"
#import "SquareController.h"
#import "MessageController.h"

#define kDockHeight 44

@interface MainController ()<DockDelegate>

@end

@implementation MainController



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    //self.view.backgroundColor =[UIColor redColor];
    
    //1 初始化所有子控制器
    [self addAllChildControllers];
    //2 初始化dock
    [self addDockItems];
    

    
    
    
}

#pragma mark 初始化dock
-(void)addDockItems
{
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


}

#pragma mark 初始化所有子控制器
-(void)addAllChildControllers
{
    //3初始化所有子控制器
    // 1.首页
    HomeController *home = [[HomeController alloc] init];
    GQNavigationController *nav1 = [[GQNavigationController alloc] initWithRootViewController:home];
    // self在，添加的子控制器就存在
    [self addChildViewController:nav1];
    
    // 2.消息
    MessageController *msg = [[MessageController alloc] init];
    GQNavigationController *nav2 = [[GQNavigationController alloc] initWithRootViewController:msg];
    [self addChildViewController:nav2];
    
    // 3.我
    MeController *me = [[MeController alloc] init];
    GQNavigationController *nav3 = [[GQNavigationController alloc] initWithRootViewController:me];
    [self addChildViewController:nav3];
    
    // 4.广场
    SquareController *square = [[SquareController alloc] init];
    GQNavigationController *nav4 = [[GQNavigationController alloc] initWithRootViewController:square];
    [self addChildViewController:nav4];
    
    // 5.更多
    MoreController *more = [[MoreController alloc] init];
    GQNavigationController *nav5 = [[GQNavigationController alloc] initWithRootViewController:more];
    [self addChildViewController:nav5];



}



#pragma mark dock的代理方法

-(void)dock:(Dock *)dock itemSelectedFrom:(int)from to:(int)to
{
    if(to<0||to>=self.childViewControllers.count) return ;
    
    //0. 移除旧控制器的view
    UIViewController *oldvc = self.childViewControllers[from];
    [oldvc.view removeFromSuperview];
    //1.取出即将显示的控制器
    UIViewController *newVc= self.childViewControllers[to];
    CGFloat width =self.view.frame.size.width;
    CGFloat height =self.view.frame.size.height-kDockHeight;
    newVc.view.frame =CGRectMake(0, 0,width,height);
    
    
    
    
    //2.添加新的控制器的view到MainController上面
    [self.view addSubview:newVc.view];
   
    
    
    
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
