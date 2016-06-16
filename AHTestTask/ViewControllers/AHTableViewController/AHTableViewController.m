//
//  ViewController.m
//  AHTestTask
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Aleksandr. All rights reserved.
//

#import "AHTableViewController.h"
#import "AHCustomCell.h"
#import "AHDataManager.h"
#import "AHRepository.h"

static const CGFloat kHeightOfCell = 110.0;

@interface AHTableViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *repositoriesArray;

@end

@implementation AHTableViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.repositoriesArray = [NSMutableArray new];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = kHeightOfCell;
    
    [self loadDataFromServer];
}

#pragma mark - Helpers

- (void)loadDataFromServer {
    [[AHDataManager sharedManager] loadDataFromServerOnSuccess:^(NSArray *responseArray) {
        
        [self.repositoriesArray addObjectsFromArray:responseArray];
        [self.tableView reloadData];
        
    } onFailure:^(NSError *error) {
        if(error) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Network unavailable"
                                                                           message:@"It is impossible to load repositories"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OkAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction *action) {}];
            [alert addAction:OkAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repositoriesArray.count;
}

- (AHCustomCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    AHCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell configureCellWithRepository:self.repositoriesArray[indexPath.row]];
    
    return cell;
}

@end
