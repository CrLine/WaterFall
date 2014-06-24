//
//  WaterViewController.m
//  WaterFall
//
//  Created by 李涛 on 8/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "WaterViewController.h"
#import "JSONKit.h"
#import "ImageInfo.h"
#import "ImageWaterView.h"


@implementation WaterViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Data" ofType:@"json"];//载入文件
    NSString *data=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];//使用文件路径初始化
    NSArray *array=[data objectFromJSONString];//解析数据
    NSLog(@"%d",array.count);//输出数据的行数
    NSMutableArray *imageArray=[[NSMutableArray alloc]init];//创建图像数组
    for (int i=0; i<array.count; i++) {
        NSDictionary *dataD=[array objectAtIndex:i];//获得数据
        if (dataD) {
            ImageInfo *image=[[ImageInfo alloc]initWithDictionary:dataD];
            [imageArray addObject:image];
        }
    }
    NSLog(@"%@",imageArray);
    NSLog(@"11");
    
    self.waterView=[[ImageWaterView alloc]initWithDataArray:imageArray withFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:self.waterView];
    __weak WaterViewController *blockSelf=self;
    [self.waterView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"上拉刷新");
        int64_t delayInSeconds=1.0;
        dispatch_time_t popTime=dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC);
        
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [blockSelf.waterView loadNextView:imageArray];
            [blockSelf.waterView.infiniteScrollingView stopAnimating];
        });
    }];
    
    [self.waterView addPullToRefreshWithActionHandler:^{
        NSLog(@"下拉更新");
        int64_t delayInSeconds=2.0;
      
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [blockSelf.waterView refreshView:imageArray];
            [blockSelf.waterView.infiniteScrollingView stopAnimating];
        });
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
