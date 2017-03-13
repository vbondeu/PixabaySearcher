//
//  AppDelegate.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "AppDelegate.h"
#import "BVAppDependencies.h"

@interface AppDelegate()
@property (nonatomic, strong, readwrite) BVAppDependencies *appDependencies;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.appDependencies = [BVAppDependencies new];
    return [self.appDependencies installRootViewControllerIntoWindow:self.window];
}

@end
