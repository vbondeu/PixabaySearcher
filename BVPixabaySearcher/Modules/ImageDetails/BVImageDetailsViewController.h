//
//  BVImageDetailsViewController.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BVImageSearch;

@protocol BVImageDetailsViewProtocol <NSObject>
- (void)reloadEntries;
- (void)showImageInfo:(BVImageSearch *)searchImage;
@end

@class BVImageDetailsWireframe;

@interface BVImageDetailsViewController : UIViewController<BVImageDetailsViewProtocol>

@property (weak, nonatomic) BVImageDetailsWireframe *navigation;
@end
