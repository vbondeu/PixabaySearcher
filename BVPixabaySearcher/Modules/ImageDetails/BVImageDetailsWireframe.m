//
//  BVImageDetailsWireframe.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVImageDetailsWireframe.h"
#import "BVImageDetailsViewController.h"

@implementation BVImageDetailsWireframe

- (void)dismissImageDetailsViewController {
    [self.imageDetailsVC dismissViewControllerAnimated:YES completion:nil];
}

@end
