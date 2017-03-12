//
//  BVSearchImagesWireframe.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol BVSearchImagesWireframeProtocol <NSObject>
- (void)presentWeatherViewControllerInWindow:(UIWindow *)window;
- (void)presentImageDetailsViewController;
@end

@class BVImageDetailsWireframe;
@class BVSearchImagesViewController;

@interface BVSearchImagesWireframe : NSObject<BVSearchImagesWireframeProtocol>
@property(nonatomic, strong) BVImageDetailsWireframe *imageDetailsWireframe;
@property(nonatomic, strong) BVSearchImagesViewController *searchImagesVC;
@end
