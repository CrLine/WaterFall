//
//  ImageInfo.h
//  WaterFall
//
//  Created by 李涛 on 9/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageInfo : NSObject
@property float width;
@property float height;
@property(nonatomic,strong) NSString *thumbURL;
-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
