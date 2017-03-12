//
//  BVHttpClient.h
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BVHttpClient : NSObject

+ (instancetype)API;
+ (void)resetSharedInstance;

- (void)getImagesSearchText:(NSString *)queryText
                    success:(void(^)(NSArray *images))successBlock
                    failure:(void(^)(NSError *error))failureBlock;
@end
