//
//  BVImageDetailsWireframe.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BVImageDetailsViewController;

@protocol BVImageDetailsWireframeProtocol <NSObject>
- (void)dismissImageDetailsViewController;
@end

@interface BVImageDetailsWireframe : NSObject<BVImageDetailsWireframeProtocol>

@property(nonatomic, strong) BVImageDetailsViewController *imageDetailsVC;
@end
