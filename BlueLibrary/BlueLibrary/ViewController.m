//
//  ViewController.m
//  BlueLibrary
//
//  Created by 徐杨 on 15/7/12.
//  Copyright (c) 2015年 xuyang. All rights reserved.
//

#import "ViewController.h"
#import "LibraryAPI.h"
#import "Album+TableRepresentation.h"
#import "HorizontalScroller.h"
#import "AlbumView.h"

#define kAlbumSectionHeight (120)

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate> {
    // Model
    NSArray *allAlbums;
    NSDictionary *currentAlbumData;
    NSInteger currentAlbumIndex;
    // View
    HorizontalScroller *scroller;
    UITableView *dataTable;
}

@end

@implementation ViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    
    currentAlbumIndex = 0;
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    
    [self loadPreviousState];
    
    // Add scroller
    scroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kAlbumSectionHeight)];
    scroller.delegate = self;
    scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    [self.view addSubview:scroller];

    [self reloadScroller];

    // Add dataTable
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                              kAlbumSectionHeight,
                                                              self.view.frame.size.width,
                                                              self.view.frame.size.height-kAlbumSectionHeight)
                                             style:UITableViewStyleGrouped];
    dataTable.dataSource = self;
    dataTable.delegate = self;
    dataTable.backgroundView = nil;
    dataTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:dataTable];

    [self showDataForAlbumAtIndex:currentAlbumIndex];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCurrentState) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadScroller {
    allAlbums = [[LibraryAPI sharedInstance] getAlbums];
    
    if (currentAlbumIndex < 0) {
        currentAlbumIndex = 0;
    } else if (currentAlbumIndex >[allAlbums count]) {
        currentAlbumIndex = [allAlbums count] - 1;
    }
    
    [scroller reload];
    
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}

- (void)showDataForAlbumAtIndex:(NSInteger)index {
    if (index < [allAlbums count]) {
        Album *album = allAlbums[index];
        currentAlbumData = [album tr_tableRepresentation];
    } else {
        currentAlbumData = nil;
    }
    
    [dataTable reloadData];
}

#pragma mark - Save & Load

- (void)saveCurrentState {
    [[NSUserDefaults standardUserDefaults] setInteger:currentAlbumIndex forKey:@"currentAlbumIndex"];
}

- (void)loadPreviousState {
    currentAlbumIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentAlbumIndex"];
    [self showDataForAlbumAtIndex:currentAlbumIndex];
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [currentAlbumData[@"title"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = currentAlbumData[@"title"][indexPath.row];
    cell.detailTextLabel.text = currentAlbumData[@"value"][indexPath.row];
    
    return cell;
}

#pragma mark - HorizontalScroller Delegate

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller *)scroller {
    return [allAlbums count];
}

- (UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index {
    Album *album = allAlbums[index];
    AlbumView *albumView = [[AlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) albumCover:album.coverUrl];
    
    return albumView;
}

- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index {
    currentAlbumIndex = index;
    [self showDataForAlbumAtIndex:index];
}

- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller {
    return currentAlbumIndex;
}

@end
