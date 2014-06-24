//
//  SelfImageView.h
//  WaterFall
//
//  Created by 李涛 on 11/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageInfo.h"
//#import "UIImageView+WebCache.h"
#define SPACE 4
#define WIDTH [UIScreen mainScreen].applicationFrame.size.width/3
@protocol ImageDelegate <NSObject>
-(void)clickImage:(ImageInfo *)data;
@end
@interface SelfImageView : UIView
@property (nonatomic)id<ImageDelegate> delegate;
@property(nonatomic,strong)ImageInfo *data;
-(id)initWithImageInfo:(ImageInfo *)image y:(float)y withA:(int)a;
@end
