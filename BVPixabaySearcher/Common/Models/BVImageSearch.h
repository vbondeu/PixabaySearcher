//
//  BVImageSearch.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BVImageSearch : NSObject

@property(nonatomic, copy) NSNumber *imageId;
@property(nonatomic, copy) NSString *pageURL;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSString *tags;
@property(nonatomic, copy) NSString *previewURL;
@property(nonatomic, copy) NSNumber *previewWidth;
@property(nonatomic, copy) NSNumber *previewHeight;
@property(nonatomic, copy) NSString *webformatURL;
@property(nonatomic, copy) NSNumber *webformatWidth;
@property(nonatomic, copy) NSNumber *webformatHeight;
@property(nonatomic, copy) NSNumber *imageWidth;
@property(nonatomic, copy) NSNumber *imageHeight;
@property(nonatomic, copy) NSNumber *views;
@property(nonatomic, copy) NSNumber *downloads;
@property(nonatomic, copy) NSNumber *favorites;
@property(nonatomic, copy) NSNumber *likes;
@property(nonatomic, copy) NSNumber *comments;
@property(nonatomic, copy) NSNumber *userId;
@property(nonatomic, copy) NSString *user;
@property(nonatomic, copy) NSString *userImageURL;

@end
