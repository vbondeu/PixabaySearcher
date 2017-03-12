//
//  BVHttpClient.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVHTTPClient.h"
#import <RestKit/RestKit.h>
#import "BVConfiguration.h"
#import "BVSearchResponseDescriptor.h"

@implementation BVHttpClient

#pragma mark - initialization

static BVHttpClient * sharedInstance;

+ (instancetype)API {
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

+ (void)resetSharedInstance {
    sharedInstance = nil;
}

- (id)init {
    if (self = [super init]) {
        [self configureRestkit];
    }
    return self;
}

- (void)configureRestkit {
    NSURL *baseURL = [NSURL URLWithString:kHTTPClientBaseURL];
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    [objectManager addResponseDescriptor:[[[BVSearchResponseDescriptor alloc] init] createResponseDescriptor]];
    [RKObjectManager setSharedManager:objectManager];
}

#pragma mark - public methods

- (void)getImagesSearchText:(NSString *)queryText
                    success:(void(^)(NSArray *images))successBlock
                    failure:(void(^)(NSError *error))failureBlock {
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@""
                                           parameters:@{@"key" : kPixAPIKey,
                                                        @"image_type" : @"photo",
                                                        @"q" : queryText}
                                              success:^(RKObjectRequestOperation *operation,
                                                        RKMappingResult *mappingResult) {
                                                  
                                                  NSArray *response = (NSArray *)mappingResult.array;
                                                  if (successBlock) {
                                                      successBlock(response);
                                                  }
                                              } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  if (failureBlock) {
                                                      failureBlock(error);
                                                  }
                                              }];
}

@end
