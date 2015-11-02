//
//  ZYStackLayout.m
//  01线性布局
//
//  Created by 章芝源 on 15/11/2.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYStackLayout.h"

@implementation ZYStackLayout



//NSMutableArray *array = [NSMutableArray array];
//NSUInteger count = [self.collectionView numberOfItemsInSection:0];
//
//for (int i = 0; i < count; i++) {
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//    UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
//    [array addObject:attrs];
//}
//
//return array;


//item在rect中的布局
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //1. 获得布局属性数量
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //创建数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //2.遍历修改属性
    for (int i = 0; i < count ; i++ ) {
        
        //取得i 所在的indexpath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        //添加到数组
        [arrayM addObject:attrs];
    }
    
    return arrayM;
}



- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

//设置每个item的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
   //1. 取得每一个item布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
   
    //获得当前属性的总个数
    NSInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    //2. 旋转属性
    //中心点
    CGFloat centerX = self.collectionView.frame.size.width * 0.5;
    CGFloat centerY = self.collectionView.frame.size.height * 0.5;
    attrs.center = CGPointMake(centerX, centerY);
    //size
    attrs.size = CGSizeMake(100, 100);
    //设置叠加, 让第一张图显示在最上面
    attrs.zIndex = count - indexPath.item;

    if (count >= 5) {
        count = 5;
    }
    
    //如果属性下标大于5 就隐藏 并且不进行旋转
    if (indexPath.item >= count) {
        attrs.hidden = YES;
        return attrs;
    }
    
    //角度增量
    CGFloat deltaAngle = M_PI_2 / count;
    //旋转角度
    CGFloat angle = indexPath.item * deltaAngle;
    //旋转
    attrs.transform = CGAffineTransformMakeRotation(angle);
    
    return attrs;
}



@end
