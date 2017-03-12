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
#import "BVImageSearch.h"

static NSString *const kImageSearchCellId = @"ImageSearchCellId";
static NSString *const kDefaultQueryWord = @"Rome";

@interface BVSearchImagesViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchbar;
@property (nonatomic, strong) NSMutableArray<BVImageSearch *> *imagesSearch;

- (void)configureView;
- (void)setupSearchBar;
- (void)refreshData;
- (void)refreshDataQuery:(NSString *)query;
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BVImageSearch *image = self.imagesSearch[indexPath.row];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchbar resignFirstResponder];
}

#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchbar resignFirstResponder];
    [self refreshDataQuery:_searchbar.text];
}

#pragma mark - Networking

- (void)refreshData {
    [self refreshDataQuery:kDefaultQueryWord];
}

- (void)refreshDataQuery:(NSString *)query {
    [[BVHttpClient API] getImagesSearchText:query
                                    success:^(NSArray *images) {
                                        self.imagesSearch = [NSMutableArray arrayWithArray:images];
                                        [self.tableView reloadData];
                                    } failure:^(NSError *error) {
                                        
                                    }];
}

@end
