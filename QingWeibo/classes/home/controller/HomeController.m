//
//  HomeController.m
//  QingWeibo
//
//  Created by guiqing on 8/8/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//

#import "HomeController.h"
#import "UIBarButtonItem+GQ.h"


@interface HomeController ()

@end

@implementation HomeController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1.设置标题
    self.title =@"home";
    
    // 2.左边的item
    //    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    UIImage *leftImage = [UIImage imageNamed:@"navigationbar_compose.png"];
    //    [leftBtn setBackgroundImage:leftImage forState:UIControlStateNormal];
    //    [leftBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_compose_highlighted.png"] forState:UIControlStateHighlighted];
    //    // 设置尺寸
    //    leftBtn.bounds = (CGRect){CGPointZero, leftImage.size};
    //    [leftBtn addTarget:self action:@selector(sendStatus) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_compose.png" highlightedIcon:@"navigationbar_compose_highlighted.png" target:self action:@selector(sendStatus)];
    
    // 3.右边的item
    //    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    UIImage *rightImage = [UIImage imageNamed:@"navigationbar_pop.png"];
    //    [rightBtn setBackgroundImage:rightImage forState:UIControlStateNormal];
    //    [rightBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_pop_highlighted.png"] forState:UIControlStateHighlighted];
    //    // 设置尺寸
    //    rightBtn.bounds = (CGRect){CGPointZero, rightImage.size};
    //    [rightBtn addTarget:self action:@selector(popMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop.png" highlightedIcon:@"navigationbar_pop_highlighted.png" target:self action:@selector(popMenu)];
    

  //4背景颜色
    self.view.backgroundColor =[UIColor whiteColor];
  


}

#pragma mark 发送微博
-(void)sendStatus{

    MyLog(@" send weibo ");

}


#pragma mark 弹出菜单
-(void)popMenu{
    MyLog(@" pop  menu ");

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
