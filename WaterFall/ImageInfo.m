//
//  ImageInfo.m
//  WaterFall
//
//  Created by 李涛 on 9/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "ImageInfo.h"

@implementation ImageInfo
-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self=[super init];
    if (self) {
        self.width=[[dictionary objectForKey:@"width"]floatValue];//将dictionary中的赋值给width
        self.height=[[dictionary objectForKey:@"height"]floatValue];
        self.thumbURL=[dictionary objectForKey:@"thumbURL"];
    
    }
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"width:%f height:%f url:%@",self.width,self.height,self.thumbURL];
}
@end
