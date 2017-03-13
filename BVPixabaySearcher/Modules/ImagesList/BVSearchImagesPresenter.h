//
//  BVSearchImagesPresenter.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BVImageSearch;
@class BVSearchImagesInteractor;
@protocol BVSearchImagesProtocol;

@protocol BVSearchImagesPresenterProtocol <NSObject>
- (void)foundImageItems:(NSArray<BVImageSearch *> *)images;
- (void)updateViewQuery:(NSString *)searchString;
- (void)errorImageItems;
@end

@interface BVSearchImagesPresenter : NSObject<BVSearchImagesPresenterProtocol>

@property(nonatomic, strong) BVSearchImagesInteractor *interactor;

- (instancetype)initWithView:(id<BVSearchImagesProtocol>)interface;
@end
