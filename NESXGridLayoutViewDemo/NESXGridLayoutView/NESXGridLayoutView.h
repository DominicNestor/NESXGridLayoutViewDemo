//
//  NESXGridLayoutView.h
//  NESXGridLayoutViewDemo
//
//  Created by Nestor on 15/1/27.
//  Copyright (c) 2015年 NesTalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NESXGridLayoutViewDatasource <NSObject>

/**
 *  @author writen by Nestor. Personal site - http://www.nestor.me , 15-01-27 15:53:41
 *
 *  数据源中有一个保存view的NSArray即可,只需要保证每一个view在正确的下标上,不需要考虑每一个view具体的位置
 *  假设每行有3个view,下标为0的view在第一行第一列,下标为3的view在第二行第一列,以此类推
 *
 *  @return 返回指定下标位置的view
 *  @warning 可以为LayoutView设置自动布局,即"translatesAutoresizingMaskIntoConstraints=NO",但是数据源中的view不应该设置该选项
 */
-(UIView *)viewAtIndex:(NSUInteger)index;

/**
 *  @author writen by Nestor. Personal site - http://www.nestor.me , 15-01-27 16:02:08
 *
 *  设置每行view的数量,行数不需要进行设置,将会根据view的数量自行计算,
 *  例如数据源总共有10个view,每行显示3个,那么总共将显示4行
 *
 *  @return 每一行view的数量
 */
-(NSUInteger)columnsForRow;

/**
 *  @author writen by Nestor. Personal site - http://www.nestor.me , 15-01-27 16:04:55
 *
 *  @return 数据源中view的总数
 */
-(NSUInteger)numberOfViews;

@end

@interface NESXGridLayoutView : UIView

//是否使用自动布局，如果使用请在外部为该组件添加constraint，子视图的大小和位置将自动调整，但是子视图内部的布局内容需要自己设置
@property (nonatomic,assign,getter=isAutoLayout) BOOL useAutoLayout;
@property (nonatomic,assign) id<NESXGridLayoutViewDatasource> datasource;
//view的上间距,包括第一行的view与上边框的间距和后续行的view与上一行view的间距,默认为10
@property (nonatomic,assign) CGFloat topMargin;
//view的左间距,包括第一列的view与做边框的间距和后续列的view与前一列view的间距,默认为10;
@property (nonatomic,assign) CGFloat leftMargin;

/**
 *  @author writen by Nestor. Personal site - http://www.nestor.me , 15-01-27 15:38:05
 *
 *  获取实例的类方法,仅在非自动布局的情况下使用
 *
 *  @param frame 视图的frame
 *
 *  @return 实例
 */
+(NESXGridLayoutView *)viewWithFrame:(CGRect)frame;
/**
 *  @author writen by Nestor. Personal site - http://www.nestor.me , 15-01-27 15:39:19
 *
 *  获取实例的类方法,仅在自动布局的情况下使用
 *
 *  @return 实例
 *  @note 如果在自动布局的情况下需要支持屏幕旋转,那么请在包含本组件的试图控制器中添加"-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator"方法,并在其中调用该组件实例的setNeedsDisplay方法
 */
+(NESXGridLayoutView *)view;

@end
