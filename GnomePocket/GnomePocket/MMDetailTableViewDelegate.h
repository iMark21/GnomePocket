//
//  MMDetailTableViewDelegate.h
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 2/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMGnomeObject.h"
#import  <UIKit/UIKit.h>

@interface MMDetailTableViewDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) UIViewController *controller;

@property (nonatomic,strong) MMGnomeObject *gnome;





-(instancetype)initWithTableView:(UITableView*)tableView controller:(UIViewController*)controller;

-(void)reloadData;

-(void)reloadDataWithGnome:(MMGnomeObject*)gnome;

@end
