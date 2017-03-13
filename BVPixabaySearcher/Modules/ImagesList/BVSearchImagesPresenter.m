//
//  BVSearchImagesPresenter.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchImagesPresenter.h"
#import "BVSearchImagesViewController.h"
#import "BVSearchImagesInteractor.h"

@interface BVSearchImagesPresenter ()
@property(nonatomic, weak) id<BVSearchImagesProtocol> interface;
@end

@implementation BVSearchImagesPresenter

- (instancetype)initWithView:(id<BVSearchImagesProtocol>)interface {
    self = [super init];
    if (self) {
        _interface = interface;
    }
    return self;
}

- (void)updateViewQuery:(NSString *)searchString {
    [self.interactor findImageItems:searchString];
}

- (void)updateImagesList {
    [self.interface reloadEntries];
}

- (void)foundImageItems:(NSArray<BVImageSearch *> *)images {
    [self.interface showDataImages:images];
}

- (void)errorImageItems {
    [self.interface showConnectionError];
}

@end
