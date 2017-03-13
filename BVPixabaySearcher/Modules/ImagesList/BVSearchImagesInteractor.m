//
//  BVSearchImagesInteractor.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchImagesInteractor.h"
#import "BVHttpClient.h"
#import "BVImageSearch.h"
#import "BVSearchImagesPresenter.h"

@interface BVSearchImagesInteractor()
@property(nonatomic, weak) BVSearchImagesPresenter *presenter;
@end

@implementation BVSearchImagesInteractor

- (instancetype)initWithPresenter:(BVSearchImagesPresenter *)presenter {
    self = [super init];
    if (self) {
        self.presenter = presenter;
    }
    return self;
}

- (void)findImageItems:(NSString *)query {
    __weak typeof(self) welf = self;
    [[BVHttpClient API] getImagesSearchText:query
                                    success:^(NSArray<BVImageSearch *> *images) {
                                        __strong typeof(self) self = welf;
                                        if (self) {
                                            [self.presenter foundImageItems:images];
                                        }                                        
                                    } failure:^(NSError *error) {
                                        __strong typeof(self) self = welf;
                                        if (self) {
                                            [self.presenter errorImageItems];
                                        }
                                    }];
}

@end
