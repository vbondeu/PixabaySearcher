//
//  BVSearchImagesViewController.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BVSearchImagesWireframe;
@class BVImageDetailsWireframe;
@class BVImageSearch;
@protocol BVSearchImagesPresenterProtocol;

@protocol BVSearchImagesProtocol <NSObject>
- (void)reloadEntries;
- (void)showDataImages:(NSArray<BVImageSearch *> *)images;
- (void)showConnectionError;
@end

@interface BVSearchImagesViewController : UITableViewController<BVSearchImagesProtocol>

@property(nonatomic, strong) BVSearchImagesWireframe *navigation;
@property(nonatomic, strong) id<BVSearchImagesPresenterProtocol> presenter;
@end
