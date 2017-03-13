//
//  BVSearchImagesInteractor.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BVSearchImagesPresenter;

@protocol BVSearchImagesInteractor <NSObject>
- (void)findImageItems:(NSString *)query;
@end

@interface BVSearchImagesInteractor : NSObject<BVSearchImagesInteractor>
- (instancetype)initWithPresenter:(BVSearchImagesPresenter *)presenter;
@end
