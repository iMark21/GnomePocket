//
//  ViewController.h
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DOPDropDownMenu.h"

@interface ViewController : UIViewController<DOPDropDownMenuDelegate,DOPDropDownMenuDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

