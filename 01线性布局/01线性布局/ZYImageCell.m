//
//  ZYImageCell.m
//  01线性布局
//
//  Created by 章芝源 on 15/11/2.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYImageCell.h"
//延展
@interface ZYImageCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;

@end
@implementation ZYImageCell
///imageName的set方法
- (void)setImageName:(NSString *)imageName
{
    ///设置属性如果是 copy类型的, 当我们重写它的set方法, 我们必须把这个属性先copy一下
    _imageName = [imageName copy];
    
    self.imageIcon.image = [UIImage imageNamed:_imageName];
}


///优化
- (void)awakeFromNib {
   
    //设置边界宽度
    //1.
    self.imageIcon.layer.borderWidth = 5;
    //2.
    //[self.imageIcon setValue:@5 forKeyPath:@"layer.borderWidth"];
    //设置边界颜色
    self.imageIcon.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageIcon.layer.cornerRadius = 10;
    self.imageIcon.layer.masksToBounds = YES;
}

@end
