//
//  MoreController.m
//  QingWeibo
//
//  Created by guiqing on 8/8/14.
//  Copyright (c) 2014 Personal. All rights reserved.
//  更多页面控制器

#import "MoreController.h"
#import "UIBarButtonItem+GQ.h"
#import "UIImage+Addtion.h"

@interface MoreController ()
{
    NSArray *_data;

}
@end

@implementation MoreController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
    //1 搭建UI界面
    [self buildUI];
    
    //2 读取plist内容
    [self loadPlist];
    
    //3 设置tableview的属性
    [self buildTableView];
    
}



#pragma mark set tableView 
-(void)buildTableView
{
    //1 set bg
    self.tableView.backgroundView=nil;//clear the style of grouped
    
    
    //0-1 的小数
    self.tableView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    
    //2 .设置tableView 每组头部的高度
    self.tableView.sectionHeaderHeight= 5;
    self.tableView.sectionFooterHeight= 0;
    
    //3 .在tableview底部添加一个退出当前帐号按钮
    self.tableView.tableFooterView =[UIButton buttonWithType:UIButtonTypeContactAdd];


}

-(void)buildUI{

    // 1.设置标题
    self.title =@"more";
    // 2.背景颜色
    self.view.backgroundColor = [UIColor brownColor];
    
    
    //3设置右上角按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:nil action:nil];


}

-(void)loadPlist{

    //bundle 就是一个文件夹 ,mainbundle就是主文件夹,在沙盒中
    NSURL * url =[[NSBundle mainBundle] URLForResource:@"More" withExtension:@"plist"];
    //原来的plist是字典为跟节点的,下面用程序重写 plist
   // NSArray *array = [NSDictionary dictionaryWithContentsOfURL:url][@"zh_CN"];
    //[array writeToFile:@"/Users/apple/Desktop/More.plist" atomically:YES];
    //使用新的
    NSArray *array =[NSArray arrayWithContentsOfURL:url];
    //我们会在各种地方用到这个数组,所以记录为成员变量
    _data = array;
    

}

#pragma mark - Table view data source
//组的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return _data.count;
}

//行的数量/组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
   // NSArray *array =_data[section];
    //return array.count;
    //data[i] 返回的是 id类型的 ,id类型的是不能用 . 语法的.所以用 [] 调用
    return [_data[section] count];
}


#pragma mark 没当有一个新的 cell 进入屏幕事业范围内的时候调用

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    //下面一行的方法中的 forindexPath 是和storyboard 一起使用的,如果用代码创建的,请删掉
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        //设置cell的背景 view :利用重用的机制 ,这是一种优化
        //3 cell背景
        //3.1默认背景
        UIImageView *bg=[[UIImageView alloc]init];
        cell.backgroundView = bg;
        
        UIImageView *bg2 =[[UIImageView alloc]init];
        cell.selectedBackgroundView = bg2;

        
    
    }
    UIImageView *bg = (UIImageView *)cell.backgroundView;
    UIImageView *bg2 =(UIImageView *)cell.selectedBackgroundView;
    
    //1取出这行对应的字典数据
    NSDictionary *dict = _data[indexPath.section] [indexPath.row];
    //2文字标题
    cell.textLabel.text = dict[@"name"];
    
    //当前组的总行数
    int count=[_data[indexPath.section] count];
    
    //只有一行的判断
    if(count){
    //这组只有一行
        bg.image =[UIImage resizedImage:@"common_card_background.png"];
        bg2.image=[UIImage resizedImage:@"common_card_background_highlighted.png"];
    
    }else if(indexPath.row==0){//当前组首行
        bg.image =[UIImage resizedImage:@"common_card_top_background.png"];
        bg2.image=[UIImage resizedImage:@"common_card_top_background_highlighted.png"];
        
    }else if(indexPath.row ==count-1){//当前组的末行
        
        bg.image =[UIImage resizedImage:@"common_card_bottom_background.png"];
        bg2.image=[UIImage resizedImage:@"common_card_bottom_background_highlighted.png"];
        
    }else{//当前组的中间行
        bg.image =[UIImage resizedImage:@"common_card_middle_background.png"];
        bg2.image=[UIImage resizedImage:@"common_card_middle_background_highlighted.png"];
     }
    
    return cell;
}



#pragma mark 点击后返回原来图片
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


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
