//
//  NESMainViewController.m
//  NESXGridLayoutViewDemo
//
//  Created by Nestor on 15/1/27.
//  Copyright (c) 2015年 NesTalk. All rights reserved.
//

#import "NESMainViewController.h"
#import "NESXGridLayoutView.h"

@interface NESMainViewController ()<NESXGridLayoutViewDatasource>

@property (nonatomic,retain) NESXGridLayoutView *layoutView;
@property (nonatomic,retain) NSArray *datasource;

@end

@implementation NESMainViewController

#pragma mark -
#pragma mark action handler

-(void)tapped:(UITapGestureRecognizer *)gesture
{
    NSLog(@"%@ tapped",gesture.view);
}

#pragma mark -
#pragma mark getters

-(NSArray *)datasource
{
    if (!_datasource) {
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:10];
        for (int i=0; i<20; i++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
            view.backgroundColor = [UIColor redColor];
            [arr addObject:view];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
            [view addGestureRecognizer:tap];
        }
        _datasource = [NSArray arrayWithArray:arr];
    }
    return _datasource;
}

-(NESXGridLayoutView *)layoutView
{
    if (!_layoutView) {
        _layoutView = [NESXGridLayoutView view];
        _layoutView.datasource = self;
        _layoutView.backgroundColor = [UIColor greenColor];
#if 1
        _layoutView.leftMargin = 2;
        _layoutView.topMargin = 2;
#endif
    }
    return _layoutView;
}

#pragma mark -
#pragma mark NESXGridLayoutView datasource methods

-(NSUInteger)columnsForRow
{
    return 5;
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
    self.title = @"自动布局";
    [self.view addSubview:self.layoutView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(self.view,_layoutView);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_layoutView]-|" options:0 metrics:0 views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_layoutView]-59-|" options:0 metrics:0 views:views]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [self.layoutView setNeedsDisplay];
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
