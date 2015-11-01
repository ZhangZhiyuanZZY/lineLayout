//
//  ZYLineLayout.m
//  01线性布局
//
//  Created by 章芝源 on 15/11/1.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYLineLayout.h"

@implementation ZYLineLayout

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

//每次界面布局改变都会调用的方法
- (void)prepareLayout
{
    //必须调用父类, 父类也有一些操作
    [super prepareLayout];
    
    //设置滚动方向(只有流水布局才有这个属性)
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置cell的尺寸  这里的collectionView应该是  viewController
    CGFloat itemH = self.collectionView.frame.size.height * 0.6;
    
    //itemSize  这个属性是流水布局中设置, item的size
    self.itemSize = CGSizeMake(itemH, itemH);
}







@end
