//
//  NESXGridLayoutView.m
//  NESXGridLayoutViewDemo
//
//  Created by Nestor on 15/1/27.
//  Copyright (c) 2015年 NesTalk. All rights reserved.
//

#import "NESXGridLayoutView.h"

@interface NESXGridLayoutView ()

@property (nonatomic,assign) CGRect realFrame;

@end

@implementation NESXGridLayoutView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.realFrame = rect;
    [self removeAllSubViews];
    [self layout];
}

-(void)removeAllSubViews;
{
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView *view = obj;
        [view removeFromSuperview];
    }];
}

-(void)layout
{
    CGRect frame = self.isAutoLayout ? self.realFrame : self.bounds;
    NSInteger columns,rows,count;
    
    if ([self.datasource respondsToSelector:@selector(numberOfViews)]) {
        count = [self.datasource numberOfViews];
    }
    else
    {
        NSLog(@"NESXGridLayoutView Error: numberOfViews方法未实现");
        return;
    }
    
    if ([self.datasource respondsToSelector:@selector(columnsForRow)]) {
        columns = [self.datasource columnsForRow];
    }
    else
    {
        NSLog(@"NESXGridLayoutView Error: columnsForRow方法未实现");
        return;
    }
    
    if (![self.datasource respondsToSelector:@selector(viewAtIndex:)]) {
        NSLog(@"NESXGridLayoutView Error: viewAtIndex方法未实现");
        return;
    }

    rows = (count - 1) / columns + 1;
    
    CGFloat width = (frame.size.width - self.leftMargin * (columns + 1)) / columns;
    CGFloat height = (frame.size.height - self.topMargin * (rows + 1)) / rows;
    

    
    for (NSUInteger i=0; i<count; i++) {
        UIView *view = [self.datasource viewAtIndex:i];
        view.frame = CGRectMake(self.leftMargin + i % columns * (width + self.leftMargin),
                                self.topMargin + i / columns * (height + self.topMargin), width, height);
        [self addSubview:view];
        if (!view.translatesAutoresizingMaskIntoConstraints) {
            [view setNeedsDisplay];
        }
    }
    
}

#pragma mark -
#pragma mark lifecycle

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.topMargin = 10;
        self.leftMargin = 10;
    }
    return self;
}

+(NESXGridLayoutView *)viewWithFrame:(CGRect)frame
{
    NESXGridLayoutView *view = [[NESXGridLayoutView alloc] initWithFrame:frame];
    view.useAutoLayout = NO;
    return view;
}

+(NESXGridLayoutView *)view
{
    NESXGridLayoutView *view = [[NESXGridLayoutView alloc ]initWithFrame:CGRectMake(1, 1, 1, 1)];
    view.useAutoLayout = YES;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

@end
