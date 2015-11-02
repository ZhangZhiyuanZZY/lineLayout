//
//  ZYCircleLayout.m
//  01线性布局
//
//  Created by 章芝源 on 15/11/2.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYCircleLayout.h"

@implementation ZYCircleLayout


///决定cell如何排布
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //1. 获得属性总数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray *array = [NSMutableArray array];
    
    //3. 循环属性, 增加角度对应的h, w
    for (int i = 0; i < count ; i++ ) {
        //创建i对应位置的NSIndexpath
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        //获得布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexpath];
        
        //属性数组添加布局属性
        [array addObject:attrs];
    }
    //4.返回
    return array;
}


//返回indexpath对应的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获得当前组中的, item的数量
    NSInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    //2. 获得大圆属性
    //半径
    CGFloat raduis = 100;
    //中心点
    CGFloat centerX = self.collectionView.frame.size.width * 0.5;
    CGFloat centerY = self.collectionView.frame.size.height * 0.5;
    //角度增量
    CGFloat deltaAngle = 2 * M_PI / count;
    
    //3. 循环属性, 增加角度对应的h, w
    
    //创建i对应的布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.size = CGSizeMake(50, 50);
    //设置层叠顺序  zIndex越大,  越在上面.
    //    attrs.zIndex = 100;

    //如果当前只有一张图片那么就 让图片显示在中心点/ 不用旋转
    if(count == 1){
        attrs.center = CGPointMake(centerX, centerY);
    }else{
        //旋转角度
        CGFloat angel = indexPath.item * deltaAngle; //
        //中心点
        CGFloat iCenterX = centerX + raduis * cos(angel);
        CGFloat iCenterY = centerY + raduis * sin(angel);
        attrs.center = CGPointMake(iCenterX, iCenterY);
        //size
           }
    
    return attrs;
   
}



@end
