//
//  BVAppDelegateTests.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>
#import "AppDelegate.h"

#import "BVSearchImagesViewController.h"
#import "BVSearchImagesWireframe.h"

#import "BVImageDetailsViewController.h"
#import "BVImageDetailsWireframe.h"
#import "BVSearchImagesPresenter.h"

@interface BVAppDelegateTests : XCTestCase

@property (nonatomic, strong) AppDelegate *testObj;
@end

@implementation BVAppDelegateTests

- (void)setUp {
    self.testObj = [[AppDelegate alloc] init];
}

- (void)tearDown {
    self.testObj = nil;
}

- (void)testAppDelegateInstantiates {
    HC_assertThat(self.testObj, HC_notNilValue());
}

- (void)testConfigureDependies {
    [self appDidFinishLaunchingWithOptions];
    HC_assertThat(self.testObj.appDependencies, HC_notNilValue());
}

- (void)testWindowCreated {
    [self appDidFinishLaunchingWithOptions];
    HC_assertThat(self.testObj.window, HC_notNilValue());
    HC_assertThat(self.testObj.window, HC_instanceOf([UIWindow class]));
}

- (void)testWindowIsFullScreen {
    [self appDidFinishLaunchingWithOptions];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect frame = self.testObj.window.frame;
    BOOL rectsMatch = CGRectEqualToRect(screenRect, frame);
    HC_assertThatBool(rectsMatch, HC_equalToBool(YES));
}

- (void)testWindowIsKey {
    [self appDidFinishLaunchingWithOptions];
    HC_assertThatBool(self.testObj.window.keyWindow, HC_equalToBool(YES));
}

- (void)testWindowIsVisible {
    [self appDidFinishLaunchingWithOptions];
    HC_assertThatBool(self.testObj.window.isHidden, HC_equalToBool(NO));
}

#pragma mark - V I P objects dependies

- (void)testMakesViewControllerRootViewController {
    [self appDidFinishLaunchingWithOptions];
    UINavigationController *nvc = (UINavigationController *)self.testObj.window.rootViewController;
    HC_assertThat(self.testObj.window.rootViewController,
                  HC_instanceOf([UINavigationController class]));
    HC_assertThat(nvc.topViewController,
                  HC_instanceOf([BVSearchImagesViewController class]));
}

- (void)testWireframeConnectedToView {
    [self appDidFinishLaunchingWithOptions];
    BVSearchImagesViewController *rootVC = (BVSearchImagesViewController *)[self topNavigationController];
    HC_assertThat(rootVC.navigation, HC_instanceOf([BVSearchImagesWireframe class]));
}

- (void)testPresenterConnectedToView {
    [self appDidFinishLaunchingWithOptions];
    BVSearchImagesViewController *rootVC = (BVSearchImagesViewController *)[self topNavigationController];
    HC_assertThat(rootVC.presenter, HC_instanceOf([BVSearchImagesPresenter class]));
}

- (void)testApplicationDidFinishLaunchingReturnsYes {
    BOOL retVal = [self appDidFinishLaunchingWithOptions];
    HC_assertThatBool(retVal, HC_equalToBool(YES));
}

- (UIViewController *)topNavigationController {
    UINavigationController *nvc = (UINavigationController *)self.testObj.window.rootViewController;
    return nvc.topViewController;
}

- (BOOL)appDidFinishLaunchingWithOptions {
    return [self.testObj application:nil didFinishLaunchingWithOptions:nil];
}

@end
