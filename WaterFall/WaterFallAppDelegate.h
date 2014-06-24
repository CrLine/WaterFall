//
//  WaterFallAppDelegate.h
//  WaterFall
//
//  Created by 李涛 on 8/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterViewController;
@interface WaterFallAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property(strong,nonatomic)WaterViewController *viewController;
@end
