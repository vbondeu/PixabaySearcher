//
//  BVImageSearch.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVImageSearch.h"

@implementation BVImageSearch

- (NSString *)description {
    return [NSString stringWithFormat:@"user: %@, tags: %@", self.user, self.tags];
}

@end
