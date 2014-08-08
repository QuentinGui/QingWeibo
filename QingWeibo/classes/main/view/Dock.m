//
//  Dock.m
//  QingWeibo
//
//  Created by guiqing on 8/7/14.
//  Copyright (c) 2014 Personal. All rights reserved.
// 底部的工具条

#import "Dock.h"
#import "DockItem.h"
#import "NSString+GQ.h"

@interface Dock()
{
    DockItem *_selelctedItem;

}
@end



@implementation Dock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    }
 
    return self;
}



#pragma mark add a seleted item

-(void)addItemWithIcon:(NSString*) icon title:(NSString*) title
{
    //1 创建item
    DockItem *item =[[DockItem alloc]init];
    [item setTitle:title forState:UIControlStateNormal];
    //[item setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    //选中图片
    [item setImage:[UIImage imageNamed:[icon fileAppend:@"_selected."]] forState:UIControlStateSelected];
    //绑定监听器
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];

    //2 添加tiem
    [self addSubview:item];
    //3循环调整所有item的位置
    int count = self.subviews.count;
    
    CGFloat height =self.frame.size.height; //dock的高度
    CGFloat width = self.frame.size.width/count;//每个item的宽度
    [UIView beginAnimations:nil context:nil];//开始动画
    
    if(count==1){
        //dockItem.selected=YES;
        //如果不写下面的,会导致首页永远被选中
        // _selelctedItem =dockItem;
        //以上两行,相当于
        [self itemClick:item];
    }
    
    for (int i=0; i<count; i++) {
        DockItem * dockItem = self.subviews[i];
        dockItem.frame=CGRectMake(width*i, 0, width, height);
        dockItem.tag = i;
       
    }

    [UIView commitAnimations];//结束动画

}




#pragma mark 监听item点击
-(void)itemClick:(DockItem*)item
{
    //0 通知代理
    if ([_delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)]) {
        [_delegate dock:self itemSelectedFrom:_selelctedItem.tag to:item.tag];
    }
    
    //1 取消当前选中的
    _selelctedItem.selected =NO;
    //2选中点击的item
    item.selected = YES;

    //3把item设置为当前选中的
    _selelctedItem = item;
  
}

@end
