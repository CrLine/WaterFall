//
//  ImageWaterView.m
//  WaterFall
//
//  Created by 李涛 on 10/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "ImageWaterView.h"
//#import "ImageInfo.h"
//#import "SelfImageView.h"
@implementation ImageWaterView
@synthesize arrayImage;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithDataArray:(NSArray *)array withFrame:(CGRect)rect
{

    self=[super initWithFrame:rect];
    if (self) {
        self.arrayImage=array;
        [self initParameter];//初始化参数
    }
    return self;
}
-(void)initParameter
{
    //每一列视图初始化
    firstView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,WIDTH,0)];
    secondView=[[UIView alloc]initWithFrame:CGRectMake(WIDTH, 0, WIDTH, 0)];
    thirdView=[[UIView alloc]initWithFrame:CGRectMake(WIDTH*2, 0, WIDTH, 0)];
    
    higher=lower=row=highValue=1;
    countImage=0;
    for (int i=0; i<self.arrayImage.count; i++) {
        if (i/3>0&&i%3==0) {
            row++;
        }
        ImageInfo *data=(ImageInfo*)[self.arrayImage objectAtIndex:i];
        
        countImage++;
        [self addViews:data with:countImage];
        [self setHigherAndLower];
        
        [self setContentSize:CGSizeMake(WIDTH, highValue)];
        [self addSubview:firstView];
        [self addSubview:secondView];
        [self addSubview:thirdView];
        
    }
}
-(void)addViews:(ImageInfo *)image with:(int)a
{
    SelfImageView *imageView=nil;
    float imageHeight=0;
    switch (lower) {
        case 1:
            imageView=[[SelfImageView alloc]initWithImageInfo:image y:firstView.frame.size.height withA:a];
            imageHeight=imageView.frame.size.height;
            firstView.frame=CGRectMake(firstView.frame.origin.x, firstView.frame.origin.y, WIDTH, firstView.frame.size.height+imageHeight);
            [firstView addSubview:imageView];
            break;
            
            case 2:
            imageView=[[SelfImageView alloc]initWithImageInfo:image y:secondView.frame.size.height withA:a];
            imageHeight=imageView.frame.size.height;
            secondView.frame=CGRectMake(secondView.frame.origin.x
                                        , secondView.frame.origin.y, WIDTH, secondView.frame.size.height+imageHeight);
            [secondView addSubview:imageView];
            break;
            
            case 3:
            imageView=[[SelfImageView alloc]initWithImageInfo:image y:thirdView.frame.size.height withA:a];
            imageHeight=imageView.frame.size.height;
            thirdView.frame=CGRectMake(thirdView.frame.origin.x
                                       , thirdView.frame.origin.y, WIDTH, thirdView.frame.size.height+imageHeight);
            [thirdView addSubview:imageView];
            break;
            
            
        default:
            break;
    }
    imageView.delegate=self;
}
-(void)setHigherAndLower
{
    float firstHeight=firstView.frame.size.height;
    float secondHeight=secondView.frame.size.height;
    float thirdHeight=thirdView.frame.size.height;
    
    if (firstHeight>highValue) {
        highValue=firstHeight;
        higher=1;
    }else if(secondHeight>highValue)
    {
        highValue=secondHeight;
        higher=2;
    }else if(thirdHeight>highValue)
    {
        highValue=thirdHeight;
        higher=3;
    }
    if (firstHeight<=secondHeight) {
        if (firstHeight<=thirdHeight) {
            lower=1;
        }else{
            lower=3;
        }
    }else{
        if (secondHeight<=thirdHeight) {
            lower=2;
        }else
        {
            lower=3;
        }
    }
}

-(void)loadNextView:(NSArray *)array
{
    for (int i=0; i<arrayImage.count; i++) {
        if (i/3>0&&i%3==0) {
            row++;
        }
        ImageInfo *data=(ImageInfo *)[arrayImage objectAtIndex:i];
        countImage++;
        [self addViews:data with:countImage];
        [self setHigherAndLower];
    }
    
    [self setContentSize:CGSizeMake(WIDTH, highValue)];
    
}

-(void)refreshView:(NSArray *)array
{
    [firstView removeFromSuperview];
    [secondView removeFromSuperview];
    [thirdView removeFromSuperview];
    firstView=nil;
    secondView=nil;
    thirdView=nil;
    self.arrayImage=array;
    [self initParameter];
}
-(void)clickImage:(ImageInfo *)data
{
    //自己做处理
    //char c4='\101',c5='\116';
    int c4=97,c5=98;
    printf("\n\n\t\b %c %c\n",c4,c5);
    NSLog(@"点击了图片：%@",data);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
