//
//  DockItem.m
//  QingWeibo
//
//  Created by guiqing on 8/7/14.
//  Copyright (c) 2014 Personal. All rights reserved.
// 一个选项卡标签

#import "DockItem.h"
//文字的高度比例
#define kTitleRatio 0.3
@implementation DockItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //1 文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //2 文字大小
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        
        //3 图片内容模式:防止填充
        self.imageView.contentMode=UIViewContentModeCenter;
        //4 设置选中时的背景
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider.png"] forState:UIControlStateSelected];
    
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//此类是实现 UIButton就有方法给我们重写
#pragma mark 调整内部imageView的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat x=0;
    CGFloat y=0;
    CGFloat width=contentRect.size.width;
    CGFloat height=contentRect.size.height*(1-kTitleRatio);
    return CGRectMake(x, y, width, height);
}
#pragma mark 调整内部label的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{

    CGFloat titleX =0;
    CGFloat titleHeight =contentRect.size.height*kTitleRatio;//文字的高度
    CGFloat titleY =contentRect.size.height-titleHeight-3;
    CGFloat titleWidth =contentRect.size.width;
    return  CGRectMake(titleX,titleY,titleWidth,titleHeight);

}

//重写按钮的 highlighted方法
-(void)setHighlighted:(BOOL)highlighted{
    //屏蔽父类的 高亮方法

}

@end
