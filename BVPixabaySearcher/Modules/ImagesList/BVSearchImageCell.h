//
//  BVSearchImageCell.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>

@class BVImageSearch;

@interface BVSearchImageCell : UITableViewCell
@property(nonatomic, strong) BVImageSearch *imageSearch;
@end
