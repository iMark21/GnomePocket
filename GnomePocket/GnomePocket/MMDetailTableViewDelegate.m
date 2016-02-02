//
//  MMDetailTableViewDelegate.m
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 2/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMDetailTableViewDelegate.h"

static NSString *CellIdentifier = @"Cell";

@implementation MMDetailTableViewDelegate


-(instancetype)initWithTableView:(UITableView*)table controller:(UIViewController*)controller{
    
    self = [super init];
    if (self) {
        
        self.controller = controller;
        self.tableView = table;
        
        [self.tableView setDelegate:self];
        [self.tableView setDataSource:self];


        
        
    }
    
    
    
    return self;
}




-(void)setTableView:(UITableView *)tableView{
    
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}



-(void)reloadDataWithGnome:(MMGnomeObject *)gnome{
    
    self.gnome = gnome;
    
    [self.tableView reloadData];
    
}


-(void)reloadData{
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary *result = [self.gnome dictionaryForObject:self.gnome];
    
    return [result allKeys].count ;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    NSDictionary *result = [self.gnome dictionaryForObject:self.gnome];
    NSArray *allKeys = [result allKeys];
    NSArray *allValues = [result allValues];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if ([[allValues objectAtIndex:indexPath.row]isKindOfClass:[NSMutableArray class]]) {
        
        cell.detailTextLabel.text = [[allValues objectAtIndex:indexPath.row] componentsJoinedByString: @","];
    
    
    }else{
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[allValues objectAtIndex:indexPath.row]] ;
    }

//    cell.textLabel.text = [allValues objectAtIndex:indexPath.row];
    cell.textLabel.text = [allKeys objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
