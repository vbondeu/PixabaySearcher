//
//  BVSearchImagesViewController.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchImagesViewController.h"
#import "BVImageDetailsViewController.h"
#import "BVSearchImageCell.h"
#import "BVHttpClient.h"

static NSString *const kImageSearchCellId = @"ImageSearchCellId";
static NSString *const kDefaultQueryWord = @"Rome";

@interface BVSearchImagesViewController ()
- (void)refreshData;
- (void)refreshDataQuery:(NSString *)query;
@end

@implementation BVSearchImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureView];
    [self refreshData];
}

- (void)configureView {
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //
}

#pragma mark - Networking

- (void)refreshData {
    [self refreshDataQuery:kDefaultQueryWord];
}

- (void)refreshDataQuery:(NSString *)query {
    [[BVHttpClient API] getImagesSearchText:query
                                    success:^(NSArray *images) {
                                        NSLog(@"-= reponse log: %@", images);
                                    } failure:^(NSError *error) {
                                        
                                    }];
}

@end
