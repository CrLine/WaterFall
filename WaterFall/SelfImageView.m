//
//  SelfImageView.m
//  WaterFall
//
//  Created by 李涛 on 11/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "SelfImageView.h"
#import "UIImageView+WebCache.h"
@implementation SelfImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithImageInfo:(ImageInfo *)imageView y:(float)y withA:(int)a
{
    float imageW=imageView.width;
    float imageH=imageView.height;
    
    float width=WIDTH-SPACE;
    float height=width*imageH/imageW;
    
    self=[super initWithFrame:CGRectMake(0, y, WIDTH, height +SPACE)];
    if (self) {
        self.data=imageView;
        UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(SPACE/2, SPACE/2, width, height)];
        NSURL *url=[NSURL URLWithString:imageView.thumbURL];
        
        [image setImageWithURL:url placeholderImage:nil];
        image.backgroundColor=[UIColor greenColor];
        [self addSubview:image];
        UILabel *labe=[[UILabel alloc]initWithFrame:CGRectMake(SPACE/2, height-20+SPACE, width, 20)];
        labe.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
        labe.text=[NSString stringWithFormat:@"第%d",a];
        self.backgroundColor=[UIColor whiteColor];
        [self addSubview:labe];
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

@end
