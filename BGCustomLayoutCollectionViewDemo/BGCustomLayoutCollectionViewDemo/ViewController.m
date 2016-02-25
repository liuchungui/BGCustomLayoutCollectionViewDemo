//
//  ViewController.m
//  BGGridView
//
//  Created by user on 15/9/15.
//  Copyright (c) 2015年 lcg. All rights reserved.
//

#import "ViewController.h"
#import "BGImageCollectionViewCell.h"
#import "BGGrideLayout.h"

static const NSInteger kRowCount = 4;
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建layout
    CGFloat spacing = 10;
    CGFloat mainScrreenWidth = [UIScreen mainScreen].bounds.size.width;
    BGGrideLayout *layout = [[BGGrideLayout alloc] init];
    layout.itemSize = CGSizeMake((mainScrreenWidth-(kRowCount+1)*spacing)/kRowCount, 150);
    layout.interitemSpacing = spacing;
    layout.lineSpacing = spacing;
    layout.contentInset = UIEdgeInsetsMake(10, 0, 0, 100);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor grayColor];
    collectionView.pagingEnabled = NO;
    collectionView.directionalLockEnabled = YES;
    [self.view addSubview:collectionView];
    
    //注册cell
    [collectionView registerNib:[UINib nibWithNibName:[BGImageCollectionViewCell cellIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[BGImageCollectionViewCell cellIdentifier]];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BGImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[BGImageCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    // Configure the cell
    NSInteger imageIndex = indexPath.section*3+indexPath.row;
    imageIndex = imageIndex % 24;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg", imageIndex]];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
