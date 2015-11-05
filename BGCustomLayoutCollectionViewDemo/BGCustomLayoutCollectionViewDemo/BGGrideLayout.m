//
//  BGGrideLayout.m
//  BGCustomLayoutCollectionViewDemo
//
//  Created by user on 15/11/4.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGGrideLayout.h"

@interface BGGrideLayout ()
/**
 *  布局信息
 */
@property (nonatomic, strong) NSArray *layoutInfoArr;
/**
 *  内容尺寸
 */
@property (nonatomic, assign) CGSize contentSize;
@end

@implementation BGGrideLayout
- (void)prepareLayout{
    [super prepareLayout];
    NSMutableArray *layoutInfoArr = [NSMutableArray array];
    NSInteger maxNumberOfItems = 0;
    //获取布局信息
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    for (NSInteger section = 0; section < numberOfSections; section++){
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:numberOfItems];
        for (NSInteger item = 0; item < numberOfItems; item++){
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [subArr addObject:attributes];
        }
        if(maxNumberOfItems < numberOfItems){
            maxNumberOfItems = numberOfItems;
        }
        //添加到二维数组
        [layoutInfoArr addObject:[subArr copy]];
    }
    //存储布局信息
    self.layoutInfoArr = [layoutInfoArr copy];
    //保存内容尺寸
    self.contentSize = CGSizeMake(maxNumberOfItems*(self.itemSize.width+self.interitemSpacing)+self.interitemSpacing, numberOfSections*(self.itemSize.height+self.lineSpacing)+self.lineSpacing);
}

- (CGSize)collectionViewContentSize{
    return self.contentSize;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *layoutAttributesArr = [NSMutableArray array];
    [self.layoutInfoArr enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger i, BOOL * _Nonnull stop) {
        [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(CGRectIntersectsRect(obj.frame, rect)) {
                [layoutAttributesArr addObject:obj];
            }
        }];
    }];
    return layoutAttributesArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //每一组cell为一行
    attributes.frame = CGRectMake((self.itemSize.width+self.interitemSpacing)*indexPath.row+self.interitemSpacing, (self.itemSize.height+self.lineSpacing)*indexPath.section+self.lineSpacing, self.itemSize.width, self.itemSize.height);
    return attributes;
}

#pragma mark - set method
- (void)setItemSize:(CGSize)itemSize{
    _itemSize = itemSize;
    [self invalidateLayout];
}

- (void)setInteritemSpacing:(CGFloat)interitemSpacing{
    _interitemSpacing = interitemSpacing;
    [self invalidateLayout];
}

- (void)setLineSpacing:(CGFloat)lineSpacing{
    _lineSpacing = lineSpacing;
    [self invalidateLayout];
}
@end
