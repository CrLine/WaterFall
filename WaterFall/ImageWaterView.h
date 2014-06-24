//
//  ImageWaterView.h
//  WaterFall
//
//  Created by 李涛 on 10/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelfImageView.h"
#define SPACE 4
#define WIDTH [UIScreen mainScreen].applicationFrame.size.width/3
@interface ImageWaterView : UIScrollView<ImageDelegate>
{
    UIView *firstView,*secondView,*thirdView;//第一列，第二列，第三列
    int higher,lower,row;//最高，最低，行数
    float highValue;//最高值
    int countImage;//图片数量
}
@property (nonatomic,strong) NSArray *arrayImage;
-(id)initWithDataArray:(NSArray *)array withFrame:(CGRect)rect;//初始化瀑布流
-(void)refreshView:(NSArray *)array;//刷新图像
-(void)loadNextView:(NSArray *)array;//加载下一页

@end
