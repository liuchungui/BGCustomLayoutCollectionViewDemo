//
//  BGImageCollectionViewCell.h
//  BGCustomLayoutCollectionViewDemo
//
//  Created by user on 15/11/4.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
+ (NSString*)cellIdentifier;
@end
