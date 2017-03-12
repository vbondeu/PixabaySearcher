//
//  BVSearchResponseDescriptor.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchResponseDescriptor.h"
#import "BVImageSearch.h"

static NSString * const kImageKeyPath = @"hits";

@implementation BVSearchResponseDescriptor

- (RKObjectMapping *)createResponseMapping {
    RKObjectMapping* imagesMapping = [RKObjectMapping mappingForClass:[BVImageSearch class]];
    [imagesMapping addAttributeMappingsFromDictionary:@{@"id" : @"imageId",
                                                        @"pageURL" : @"pageURL",
                                                        @"type" : @"type",
                                                        @"tags" : @"tags",
                                                        @"previewURL" : @"previewURL",
                                                        @"previewWidth" : @"previewWidth",
                                                        @"previewHeight" : @"previewHeight",
                                                        @"webformatURL" : @"webformatURL",
                                                        @"webformatWidth" : @"webformatWidth",
                                                        @"webformatHeight" : @"webformatHeight",
                                                        @"imageWidth" : @"imageHeight",
                                                        @"views" : @"views",
                                                        @"downloads" : @"downloads",
                                                        @"favorites" : @"favorites",
                                                        @"likes" : @"likes",
                                                        @"comments" : @"comments",
                                                        @"user_id" : @"userId",
                                                        @"user" : @"user",
                                                        @"userImageURL" : @"userImageURL"
                                                        }
     ];
    
    return imagesMapping;
}

- (RKResponseDescriptor *)createResponseDescriptor {
    RKObjectMapping *imagesMapping = [self createResponseMapping];
    RKResponseDescriptor *imagesResponseDescriptor = [RKResponseDescriptor
                                                      responseDescriptorWithMapping:imagesMapping
                                                      method:RKRequestMethodAny
                                                      pathPattern:nil
                                                      keyPath:kImageKeyPath
                                                      statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    return imagesResponseDescriptor;
}

@end
