//
//  BVSearchImagesViewController.m
//  BVPixabaySearcher
//
//  Created by VBond on 3/12/17.
//  Copyright © 2017 VBond. All rights reserved.
//

#import "BVSearchImagesViewController.h"
#import "BVImageDetailsViewController.h"
#import "BVSearchImagesWireframe.h"
#import "BVImageDetailsWireframe.h"
#import "BVSearchImagesPresenter.h"
#import "BVSearchImageCell.h"
#import "BVHttpClient.h"
#import "BVImageSearch.h"

static NSString *const kImageSearchCellId = @"ImageSearchCellId";
static NSString *const kDefaultQueryWord = @"apples";

@interface BVSearchImagesViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchbar;
@property (nonatomic, strong) NSMutableArray<BVImageSearch *> *imagesSearch;

- (void)configureView;
- (void)setupSearchBar;
- (void)refreshData;
@end

@implementation BVSearchImagesViewController

#pragma mark - UI life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configureView];
    [self refreshData];
}

- (void)configureView {
    [self setupSearchBar];
}

- (void)setupSearchBar {
    _searchbar = [UISearchBar new];
    _searchbar.delegate = self;
    self.navigationItem.titleView = self.searchbar;
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imagesSearch.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BVSearchImageCell *cell = [tableView dequeueReusableCellWithIdentifier:kImageSearchCellId forIndexPath:indexPath];
    BVImageSearch *imageSearch = self.imagesSearch[indexPath.row];
    cell.imageSearch = imageSearch;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BVImageSearch *imageInfo = self.imagesSearch[indexPath.row];
    [self.navigation presentImageDetailsViewController];
    [self.navigation.imageDetailsWireframe.imageDetailsVC showImageInfo:imageInfo];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchbar resignFirstResponder];
}


#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchbar resignFirstResponder];
    [self.presenter updateViewQuery:_searchbar.text];
}

#pragma mark - Networking

- (void)refreshData {
    [self.presenter updateViewQuery:kDefaultQueryWord];
}

#pragma mark - BVSearchImagesProtocol

- (void)reloadEntries {
    [self.tableView reloadData];
}

- (void)showDataImages:(NSArray<BVImageSearch *> *)images {
    self.imagesSearch = [[NSMutableArray alloc] initWithArray:images];
    [self reloadEntries];
}

#pragma mark - Error Alert

- (void)showConnectionError {
    NSString *title = @"Connection error";

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                     }];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController
                       animated:YES
                     completion:^{
                     }];
}

@end
