//
//  NewFeatureController.m
//  QingWeibo
//
//  Created by guiqing on 8/5/14.
//  Copyright (c) 2014 Personal. All rights reserved.
// 

#import "NewFeatureController.h"
#import "UIImage+Addtion.h"
#import "MainController.h"
#define kImageCount 4

@interface NewFeatureController ()<UIScrollViewDelegate>
{
    UIPageControl *_page;
    UIScrollView *_scroll;

}
@end

@implementation NewFeatureController

// custom view :need to overwrite loadView:avoid its super calss create a useless blank view
-(void)loadView{

//don't [super loadView]
    UIImageView *imageView =[[UIImageView alloc]init];
    imageView.image=[UIImage fullScreenImage:@"new_feature_background.png"];
    
    imageView.frame = [UIScreen mainScreen].applicationFrame;
    imageView.userInteractionEnabled=YES;
    /*
     以3.5inch为例 (640*960)点坐标是 320 480
     applicationFrame的好处是自动判断是否有状态栏
     1>当没有状态栏 applicationFrame的只{{0,0}{320,480}}
     2>当有状态栏 applicationFrame的只{{0,0}{320,460}}\
     而 bounds的值是固定的
     */
    
    
    self.view=imageView;
    
    

}
/*
 一个控件无法显示的时候,可能的原因:
 1.没有设置宽高[或者宽高没有值]
 2.位置不对
 3.hidden=YES
 4.没有添加控制器的view上面
 */
/*
 一个scrollview无法滚动
 1.contentSize 没有值
 2.scrollView不能接收到触摸事件
 
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    //debug ,why there ain't images her
   // NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    //out put   0 0 0 0
   
    //1. add UIScrollView
    [self addScrollView];
    //2. add images
    [self addScrollImages];
    
    //3. add UIPageControll
    [self addPageControl];
   
    
    
    
}







#pragma mark - UI界面初始化
#pragma mark 添加scrollview
-(void)addScrollView
{
    UIScrollView *scroll =[[UIScrollView alloc]init];
    
    scroll.frame=self.view.bounds;
    
    CGSize size = scroll.frame.size;
    
    scroll.showsHorizontalScrollIndicator=NO;//hide scroll bar
    //if you wanna scroll ,you must set the contentsize
    scroll.contentSize=CGSizeMake(size.width*kImageCount,0);
    scroll.pagingEnabled = YES;
    //为了让page监听滚动,需要设置代理
    scroll.delegate =self;
    
    
    [self.view addSubview:scroll];
    _scroll=scroll;

}
#pragma mark 添加pageControl
-(void)addPageControl{
    CGSize size = self.view.frame.size ;
    
    
    UIPageControl * page =[[UIPageControl alloc]init];
    page.center=CGPointMake(size.width*0.5, size.height*0.95) ;
    page.currentPageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point.png"]];//[UIColor redColor];
    page.pageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point"]];
    page.numberOfPages=kImageCount;
    page.bounds=CGRectMake(0, 0, 150, 0) ;//height for it can't be set ,it is 36
    [self.view addSubview:page];
    /*
     bound 只影响大小,不影响宽高
     frame 可以影响宽高
     */
     _page=page;

}

#pragma mark 添加各种图片
-(void)addScrollImages{
    
    CGSize size =_scroll.frame.size;
    
    
    for (int i=0; i<kImageCount; i++) {
        
        UIImageView *imageView =[[UIImageView alloc]init];
        //show the pics
        NSString *name =[NSString stringWithFormat:@"new_feature_%d.png",i+1];
        imageView.image=[UIImage fullScreenImage:name];
        //set frame
        
        imageView.frame=CGRectMake(i*size.width, 0, size.width, size.height);
        
        
        [_scroll addSubview:imageView];
        //如果是最后一个imageView ,那么添加按钮
        if(i==kImageCount-1){
            //add button
            //1. checkbox button
            UIButton *start =[UIButton buttonWithType:UIButtonTypeCustom];
            [start setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button.png"] forState:UIControlStateNormal];
            
            [start setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted.png"] forState:UIControlStateHighlighted];
            
            
            
            
            UIImage *startNormal = [UIImage imageNamed:@"new_feature_finish_button.png"];
            start.center =CGPointMake(size.width*0.5, size.height*0.8);
            start.bounds =CGRectMake(0,0, startNormal.size.width, startNormal.size.height);
            // start.bounds =(CGRect){CGPointZero,startNormal.size};//eaqual to upper
            [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
            
            [imageView addSubview:start];
            
            //1. checkbox button
            UIButton *share =[UIButton buttonWithType:UIButtonTypeCustom];
            [share setBackgroundImage:[UIImage imageNamed:@"new_feature_share_false.png"] forState:UIControlStateNormal];
            
            [share setBackgroundImage:[UIImage imageNamed:@"new_feature_share_true.png"] forState:UIControlStateSelected];
            /*
             几种状态的讲解
             UIControlStateNormal :正常状态
             UIControlStateHighted:高亮选中状态(人为控制,长按某个空间才能到此状态)
             UIControlStateSelected :被选中(代码控制,通过 selected属性)
             UIControlStateDisabled :失效,代码控制
             
             */
            
            UIImage *shareNormal = [UIImage imageNamed:@"new_feature_share_true.png"];
            share.center =CGPointMake(start.center.x,start.center.y-50);
            // start.bounds =CGRectMake(0,0, startNormal.size.width, startNormal.size.height);
            share.bounds =(CGRect){CGPointZero,shareNormal.size};//eaqual to upper
            [share addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
            
            //高亮时,是否调整图片:高亮时候不变灰
            share.adjustsImageWhenHighlighted =NO;
            //选中
            share.selected = YES;
            
            [imageView addSubview:share];
            
            //如果不做以下操作,会导致立即体验拿不到图片
            [imageView setUserInteractionEnabled:YES];
            
            
            
        }
        
        
        
    }


}


#pragma mark -点击立即体验按钮
#pragma mark start
-(void)start{
   // NSLog(@"go to main face");
    //打印不能用NSLog ,因为发布的时候,NSLog要整个项目去找,应该用自定义的
    MyLog(@"start useing weibo");
    //我们采用替换根控制器的方式来实现跳转 两种方式获取根控制器
    ///1 [UIApplication sharedApplication].keyWindow;
    ///2 self.view.window;
    [UIApplication sharedApplication].statusBarHidden =NO;
    self.view.window.rootViewController =[[MainController alloc]init];

}
#pragma mark share
-(void)share:(UIButton*)btn{
    btn.selected =!btn.selected;
}

#pragma mark - 滚动代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _page.currentPage=scrollView.contentOffset.x/scrollView.frame.size.width;
   

}

#pragma mark 为了验证是否销毁了
-(void)dealloc
{

    MyLog(@"new-----dealloc");
}


@end
