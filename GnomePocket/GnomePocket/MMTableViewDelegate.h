//
//  MMTableViewDelegate.h
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>

@interface MMTableViewDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) UIViewController *controller;

@property (nonatomic,strong) NSArray *items;





-(instancetype)initWithTableView:(UITableView*)tableView controller:(UIViewController*)controller;

-(void)reloadData;

-(void)reloadDataWithItems:(NSArray*)items;


@end
