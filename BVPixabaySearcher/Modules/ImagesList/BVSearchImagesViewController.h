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
@class BVSearchImagesPresenter;

@interface BVSearchImagesViewController : UITableViewController

@property(nonatomic, strong) BVSearchImagesWireframe *navigation;
@property(nonatomic, strong) BVSearchImagesPresenter *presenter;
@end
