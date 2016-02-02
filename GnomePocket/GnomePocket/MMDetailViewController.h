//
//  MMDetailViewController.h
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 2/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMGnomeObject.h"

@interface MMDetailViewController : UIViewController

@property (nonatomic,strong) MMGnomeObject *gnome;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
