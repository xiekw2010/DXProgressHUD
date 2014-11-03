//
//  DemoTableViewController.m
//  DXProgressHUD
//
//  Created by xiekw on 11/3/14.
//  Copyright (c) 2014 xiekw. All rights reserved.
//

#import "DemoTableViewController.h"
#import "DXProgressHUD.h"

@interface DemoTableViewController ()

@property (nonatomic, strong) NSArray *funsArray;

@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"DXProgressHUD";
    self.funsArray = @[@"Simple", @"Simple with text", @"progress", @"success", @"error", @"custom"];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FICDDemoImage015.jpg"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.funsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 20)];
    label.textColor = [UIColor blackColor];
    label.text = section == 0 ? @"Dark" : @"White";
    label.backgroundColor = [UIColor grayColor];
    return label;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.funsArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [DXProgressHUD setTranslucentStyle:indexPath.section == 0? DXProgressTranslucentStyleBlack : DXProgressTranslucentStyleWhite];
    
    if (indexPath.row == 0) {
        [DXProgressHUD showWithStatus:nil];
    }else if (indexPath.row == 1) {
        [DXProgressHUD showWithStatus:@"Loading"];
    }else if (indexPath.row == 2) {
        for (int i = 0; i < 100; i ++) {
            [DXProgressHUD showProgress:i/100.0 status:@"Downloading"];
        }
        
    }else if (indexPath.row == 3) {
        [DXProgressHUD showSuccessWithStatus:@"Success"];
    }else if (indexPath.row == 4) {
        [DXProgressHUD showErrorWithStatus:@"Error"];
    }else if (indexPath.row == 5) {
        [DXProgressHUD showImage:nil status:@"Custom now, crodiele" duration:5.0];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DXProgressHUD dismiss];
    });
}

@end
