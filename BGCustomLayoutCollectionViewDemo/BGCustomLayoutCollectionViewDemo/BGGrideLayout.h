//
//  BGGrideLayout.h
//  BGCustomLayoutCollectionViewDemo
//
//  Created by user on 15/11/4.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  此layout布局之后是一个grideView
 */
@interface BGGrideLayout : UICollectionViewLayout
/**
 *  item大小
 */
@property (nonatomic, assign) CGSize itemSize;
/**
 *  cell与cell之间的距离
 */
@property (nonatomic, assign) CGFloat interitemSpacing;
/**
 *  一行cell与一行cell之间的距离
 */
@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, assign) UIEdgeInsets contentInset;
@end
