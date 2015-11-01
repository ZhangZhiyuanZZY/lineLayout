//
//  ViewController.m
//  01线性布局
//
//  Created by 章芝源 on 15/11/1.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYLineLayout.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, strong)UICollectionView *collectionView;

@property(nonatomic, strong)NSMutableArray *images;
@end

static NSString *ID = @"image";
@implementation ViewController

- (NSMutableArray *)images
{
    if (_images == nil) {
        self.images = [[NSMutableArray alloc]init];
        for (int i = 0; i < 20 ; i++ ) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置collectionView  frame
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w, 200);
    
    //创建布局
    ZYLineLayout *layout = [[ZYLineLayout alloc]init];
    
    
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
    
    //注册cell  注意 注册必须使用  collectionView
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    //cell
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


@end
