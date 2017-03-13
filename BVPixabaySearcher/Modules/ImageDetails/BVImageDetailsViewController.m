//
//  BVImageDetailsViewController.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVImageDetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "BVImageDetailsWireframe.h"
#import "BVImageSearch.h"

@interface BVImageDetailsViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *tagsLabel;
@property (strong, nonatomic) IBOutlet UILabel *commentsLabel;
@property (strong, nonatomic) IBOutlet UILabel *favLabel;
@property (strong, nonatomic) IBOutlet UILabel *likesLabel;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leadingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *trailingConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@end

@implementation BVImageDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

- (void)configureView {
    self.imageView.image = [UIImage imageNamed:@"ImagePlaceholder"];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
}
     
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self updateMinZoomScaleForSize:self.view.bounds.size];
}

#pragma mark - UIScrollViewDelegate

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self updateConstraintsForSize:self.view.bounds.size];
}

- (void)updateConstraintsForSize:(CGSize)size {
    CGFloat yOffset = MAX(0, (size.height - self.imageView.frame.size.height) / 2);
    self.topConstraint.constant = yOffset;
    self.bottomConstraint.constant = yOffset;
    
    CGFloat xOffset = MAX(0, (size.width - self.imageView.frame.size.width) / 2);
    self.leadingConstraint.constant = xOffset;
    self.trailingConstraint.constant = xOffset;
    
    [self.view layoutIfNeeded];
}

- (void)updateMinZoomScaleForSize:(CGSize)size {
    CGFloat widthScale = size.width / self.imageView.bounds.size.width;
    CGFloat heightScale = size.height / self.imageView.bounds.size.height;
    CGFloat minScale = MIN(widthScale, heightScale);

    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.zoomScale = minScale;
}

#pragma mark - BVImageDetailsViewProtocol

- (void)showImageInfo:(BVImageSearch *)searchImage {
    
    self.tagsLabel.text = searchImage.tags;
    self.likesLabel.text = searchImage.favorites.stringValue;
    self.commentsLabel.text = searchImage.comments.stringValue;
    self.favLabel.text = searchImage.favorites.stringValue;
    self.userNameLabel.text = searchImage.user;
    
    NSURL *url = [NSURL URLWithString:searchImage.webformatURL];
    [self.imageView sd_setImageWithURL:url
                      placeholderImage:[UIImage imageNamed:@"ImagePlaceholder"]];
    
    [self.view layoutIfNeeded];
}

- (IBAction)didTapExitButton:(id)sender {
    [self.navigation dismissImageDetailsViewController];
}

@end
