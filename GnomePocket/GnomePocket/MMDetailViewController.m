//
//  MMDetailViewController.m
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 2/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMDetailViewController.h"
#import "MMDetailTableViewDelegate.h"

@interface MMDetailViewController ()

@property (nonatomic,strong) MMDetailTableViewDelegate *tableViewDelegate;

@end

@implementation MMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tableViewDelegate = [[MMDetailTableViewDelegate alloc] initWithTableView:self.tableView controller:self];
    
    [self.tableViewDelegate reloadDataWithGnome:self.gnome];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
