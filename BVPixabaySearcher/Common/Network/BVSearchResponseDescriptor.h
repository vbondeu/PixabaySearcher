//
//  BVSearchResponseDescriptor.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface BVSearchResponseDescriptor : NSObject

- (RKResponseDescriptor *)createResponseDescriptor;
@end
