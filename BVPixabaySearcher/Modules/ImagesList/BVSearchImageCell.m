//
//  BVSearchImageCell.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchImageCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "BVImageSearch.h"

@interface BVSearchImageCell()

@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *tagsLabel;
@end

@implementation BVSearchImageCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:NO];
}

- (void)setImageSearch:(BVImageSearch *)imageSearch {
    self.userNameLabel.text = imageSearch.user;
    self.tagsLabel.text = imageSearch.tags;
    
    NSURL *url = [NSURL URLWithString:imageSearch.webformatURL];
    [self.imageView sd_setImageWithURL:url
                      placeholderImage:[UIImage imageNamed:@"ImagePlaceholder"]];
    [self layoutIfNeeded];
}

@end
