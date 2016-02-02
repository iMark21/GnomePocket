//
//  MMTableViewDelegate.m
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMTableViewDelegate.h"
#import "MMMainTableViewCell.h"
#import "MMGnomeObject.h"
#import <SDWebImage/SDImageCache.h>
#import "UIImageView+WebCache.h"
#import "UIImage+Blur.h"
#import "MMDetailViewController.h"

@implementation MMTableViewDelegate

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



-(void)reloadDataWithItems:(NSArray*)items{
    
    if ([items count]>0){
        
        self.items = items;
        
        
    }else{
        
        [self showMessage:@"No Gnome available for this filter" withTitle:@"Error"];
        
        
    }
    

    [self.tableView reloadData];
    
}


-(void)reloadData{
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.items count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    MMMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MMMainTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    MMGnomeObject *item = [self.items objectAtIndex:indexPath.row];
    cell.nameLabel.text =  item.name;
    cell.ageLabel.text = [NSString stringWithFormat:@"Age: %d",item.age
                          ];
    
    [cell.imageAvatar sd_setImageWithURL:[NSURL URLWithString:item.image] placeholderImage:[UIImage imageNamed:@"placeholder.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        cell.backgraoundImage.image = [self effectBlurredForImageView:cell.imageAvatar];
        
    }];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMDetailViewController *detail = [[MMDetailViewController alloc] initWithNibName:nil bundle:nil];
    
    detail.gnome = (MMGnomeObject*)[self.items objectAtIndex:indexPath.row];
    
    [(UINavigationController*)self.controller.navigationController pushViewController:detail animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(UIImage*)effectBlurredForImageView: (UIImageView*)imageView{

    
    float quality = .00009f;
    
    float blurred = .99f;
        
    
    NSData *imageData = UIImageJPEGRepresentation([imageView image], quality);
    
    UIImage *blurredImage = [[UIImage imageWithData:imageData] blurredImage:blurred];
    
    return blurredImage;
        
    
    
    
    
}

#pragma error_handler

-(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

@end
