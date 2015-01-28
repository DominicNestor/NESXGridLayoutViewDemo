//
//  NESSecondViewController.m
//  NESXGridLayoutViewDemo
//
//  Created by Nestor on 15/1/27.
//  Copyright (c) 2015年 NesTalk. All rights reserved.
//

#import "NESSecondViewController.h"
#import "NESXGridLayoutView.h"

@interface NESSecondViewController ()<NESXGridLayoutViewDatasource>

@property (nonatomic,retain) NESXGridLayoutView *layoutView;
@property (nonatomic,retain) NSArray *datasource;

@end

@implementation NESSecondViewController

#pragma mark -
#pragma mark getters

-(NSArray *)datasource
{
    if (!_datasource) {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:10];
        for (int i=0; i<17; i++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
            view.backgroundColor = [UIColor redColor];
            [arr addObject:view];
        }
        _datasource = [NSArray arrayWithArray:arr];
    }
    return _datasource;
}

-(NESXGridLayoutView *)layoutView
{
    if (!_layoutView) {
        _layoutView = [NESXGridLayoutView viewWithFrame:CGRectMake(10, 30, 300, 300)];
        _layoutView.datasource = self;
        _layoutView.backgroundColor = [UIColor greenColor];
    }
    return _layoutView;
}

#pragma mark -
#pragma mark NESXGridLayoutView datasource methods

-(NSUInteger)columnsForRow
{
    return 4;
}

-(NSUInteger)numberOfViews
{
    return self.datasource.count;
}

-(UIView *)viewAtIndex:(NSUInteger)index
{
    return [self.datasource objectAtIndex:index];
}

#pragma mark -
#pragma mark lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"非自动布局";
    [self.view addSubview:self.layoutView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
