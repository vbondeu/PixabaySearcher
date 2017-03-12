//
//  BVSearchImagesWireframe.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchImagesWireframe.h"
#import "BVSearchImagesViewController.h"
#import "BVImageDetailsWireframe.h"
#import "BVImageDetailsViewController.h"
#import "BVConfiguration.h"

@interface BVSearchImagesWireframe()
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation BVSearchImagesWireframe

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.navigationController = [[UIStoryboard storyboardWithName:kMainStoryboard bundle:nil] instantiateViewControllerWithIdentifier:@"searchListStoryboard"];
    self.searchImagesVC = (BVSearchImagesViewController *)self.navigationController.topViewController;
}

- (void)presentWeatherViewControllerInWindow:(UIWindow *)window {
    self.searchImagesVC.navigation = self;
    window.rootViewController = self.navigationController;
    [window makeKeyAndVisible];
}

- (void)presentImageDetailsViewController {
    BVImageDetailsViewController *imageDetails = [[UIStoryboard storyboardWithName:kMainStoryboard bundle:nil] instantiateViewControllerWithIdentifier:@"imageDetailsStoryboard"];
    self.imageDetailsWireframe.imageDetailsVC = imageDetails;
    imageDetails.navigation = self.imageDetailsWireframe;
    [self.searchImagesVC.navigationController presentViewController:imageDetails animated:YES completion:nil];
}

@end
