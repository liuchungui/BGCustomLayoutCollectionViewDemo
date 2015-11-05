//
//  BGCollectionViewController.m
//  BGCustomLayoutCollectionViewDemo
//
//  Created by user on 15/11/4.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGCollectionViewController.h"
#import "BGImageCollectionViewCell.h"
#import "BGGrideLayout.h"

static const NSInteger kRowCount = 4;
@interface BGCollectionViewController ()

@end

@implementation BGCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 设置collectionView的layout
    CGFloat spacing = 10;
    CGFloat mainScrreenWidth = [UIScreen mainScreen].bounds.size.width;
    BGGrideLayout *layout = (BGGrideLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake((mainScrreenWidth-(kRowCount+1)*spacing)/kRowCount, 150);
    layout.interitemSpacing = spacing;
    layout.lineSpacing = spacing;
    
    
    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:[BGImageCollectionViewCell cellIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[BGImageCollectionViewCell cellIdentifier]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BGImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[BGImageCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    // Configure the cell
    NSInteger imageIndex = indexPath.section*3+indexPath.row;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg", imageIndex]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
