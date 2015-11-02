//
//  ViewController.m
//  01线性布局
//
//  Created by 章芝源 on 15/11/1.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYLineLayout.h"
#import "ZYImageCell.h"
#import "ZYCircleLayout.h"
#import "ZYStackLayout.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, weak) UICollectionView *collectionView;

@property(nonatomic, strong)NSMutableArray *images;
@end

static NSString *ID = @"image";
@implementation ViewController

- (NSMutableArray *)images
{
    if (_images == nil) {
        self.images = [[NSMutableArray alloc]init];
        for (int i = 1; i <= 20 ; i++ ) {  //这里不能从0  开始 因为图片的名字是从1开始的
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}

#pragma mark - 点击切换布局
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.collectionView.collectionViewLayout = [[ZYLineLayout alloc]init];
    if([self.collectionView.collectionViewLayout isKindOfClass:[ZYStackLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[ZYCircleLayout alloc]init] animated:YES];
    }
    else if ([self.collectionView.collectionViewLayout isKindOfClass:[ZYCircleLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[ZYStackLayout alloc]init] animated:YES];
    }
    
//    if ([self.collectionView.collectionViewLayout isKindOfClass:[HMLineLayout class]]) {
//        [self.collectionView setCollectionViewLayout:[[HMCircleLayout alloc] init] animated:YES];
//    } else if ([self.collectionView.collectionViewLayout isKindOfClass:[HMCircleLayout class]]) {
//        [self.collectionView setCollectionViewLayout:[[HMLineLayout alloc] init] animated:YES];
//    }

}







- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置collectionView  frame
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w, 300);
    
    //创建布局
    ZYLineLayout *layout = [[ZYLineLayout alloc]init];

    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
    
    //注册cell  注意 注册必须使用  collectionView
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    [collectionView registerNib:[UINib nibWithNibName:@"ZYImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    //设置代理数据源xa
    collectionView.dataSource = self;
    collectionView.delegate = self;

    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    //创建cell
    ZYImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    //cell
    //cell.backgroundColor = [UIColor redColor];
    cell.imageName = self.images[indexPath.row];
    
    return cell;
}

//#pragma mark -代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //删除点击到的  indexPath.item数据
    [self.images removeObjectAtIndex:indexPath.item];
    
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    
    //刷新
//    [self.collectionView reloadData];
//    NSLog(@"%tu", indexPath.item);
}

@end
