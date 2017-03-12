//
//  BVAppDependencies.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVAppDependencies.h"
#import "BVSearchImagesWireframe.h"
#import "BVImageDetailsWireframe.h"
#import "BVSearchImagesPresenter.h"
#import "BVSearchImagesViewController.h"

@interface BVAppDependencies()
@property(nonatomic, strong) BVSearchImagesWireframe *searchImagesWireframe;
@end

@implementation BVAppDependencies

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self configureDependencies];
    }
    return self;
}

- (void)configureDependencies {
    self.searchImagesWireframe = [BVSearchImagesWireframe new];
    self.searchImagesWireframe.imageDetailsWireframe = [BVImageDetailsWireframe new];
    
    BVSearchImagesPresenter *searchPresenter = [[BVSearchImagesPresenter alloc] initWithView:self.searchImagesWireframe.searchImagesVC.tableView];
    self.searchImagesWireframe.searchImagesVC.presenter = searchPresenter;
}

- (BOOL)installRootViewControllerIntoWindow:(UIWindow *)window {
    [self.searchImagesWireframe presentWeatherViewControllerInWindow:window];
    return YES;
}

@end
