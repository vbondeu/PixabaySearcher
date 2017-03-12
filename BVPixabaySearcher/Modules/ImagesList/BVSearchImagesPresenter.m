//
//  BVSearchImagesPresenter.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchImagesPresenter.h"

@interface BVSearchImagesPresenter ()
@property(nonatomic, weak) UITableView *tableView;
@end

@implementation BVSearchImagesPresenter

- (instancetype)initWithView:(UITableView *)view {
    self = [super init];
    if (self) {
        _tableView = view;
    }
    return self;
}

- (void)updateImagesList {
    [self.tableView reloadData];
}

@end
