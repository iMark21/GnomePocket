//
//  ViewController.m
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//



#import "ViewController.h"
#import "MMAPI.h"
#import "MMTableViewDelegate.h"
#import "MMGnomeObject.h"
#import "SVProgressHUD.h"
#import "DOPDropDownMenu.h"
#import "MMFilterManager.h"


@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *parsedItems;
@property (nonatomic, strong) NSArray *filteredItems;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *profession;
@property (nonatomic, strong) NSString *friend;
@property (nonatomic,strong) MMTableViewDelegate *tableViewDelegate;
@property (nonatomic, strong) DOPDropDownMenu *menu;

//filters
@property (nonatomic,strong) NSArray *ages;
@property (nonatomic,strong) NSArray *friends;
@property (nonatomic,strong) NSArray *professions;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filteredItems = [NSArray array];
    

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (self.parsedItems.count < 1) {
        self.parsedItems = [NSMutableArray array];
        
        self.tableViewDelegate = [[MMTableViewDelegate alloc] initWithTableView:self.tableView controller:self];
        
        [self loadData];
    }
    
    
    
    
}

-(void)loadData{
    
    [SVProgressHUD showWithStatus:@"Loading" maskType:SVProgressHUDMaskTypeGradient];
    
    [[MMAPI sharedInstance] getJSONDataForAPI:@"https://raw.githubusercontent.com/AXA-GROUP-SOLUTIONS/mobilefactory-test/master/data.json" completionBlock:^(NSDictionary *jsonDictionary, NSError *error) {
        
        NSArray *result =  [jsonDictionary objectForKey:@"Brastlewark"];
        
        for (id item in result) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                MMGnomeObject *gnome = [[MMGnomeObject alloc] initWithDictionary:item];
                
                [self.parsedItems addObject:gnome];
                
                [self.tableViewDelegate reloadDataWithItems:self.parsedItems];
                
                
                [self createMenu];
                
            });
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.tableView setTableHeaderView:self.menu];
            
            [SVProgressHUD dismiss];
            
        });

    }];
    
}

-(void)createMenu{
    
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, self.view.frame.size.width) andHeight:40];
    menu.dataSource = self;
    menu.delegate = self;
    
    self.ages = [[MMFilterManager sharedInstance]arrayAgesFromArrayOfGnomes:self.parsedItems];

    
    self.professions = [[MMFilterManager sharedInstance]arrayProfessionsFromArrayOfGnomes:self.parsedItems];
    
    self.friends = [[MMFilterManager sharedInstance]arrayFriendsFromArrayOfGnomes:self.parsedItems];

    self.menu = menu;
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu {
    
 
    return 3;
    
    
    
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    
    switch (column) {
            
        case 0:
            
            return [self.ages count];
            
            break;
            
        case 1:
            return [self.professions count];
            
            break;
            
        case 2:
            return [self.friends count];
            
            break;
       
        default:
            return 0;
            break;
    }

    
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath {
    switch (indexPath.column) {
        case 0:
            
            return [NSString stringWithFormat:@"%@",self.ages[indexPath.row]];
            break;
        case 1:

            return self.professions[indexPath.row];
            break;
        case 2:
            return self.friends[indexPath.row];
            break;
        default:
            return nil;
            break;
    }
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath {

    NSString *title = [menu titleForRowAtIndexPath:indexPath];

    switch (indexPath.column) {
        case 0:
            self.age = title;
            break;
            
        case 1:
            self.profession = title;
            break;
            
        case 2:
            self.friend = title;
            break;
            
        default:
            break;
    }
    
    self.filteredItems = [[MMFilterManager sharedInstance]gnomeFromArray:self.parsedItems Age:self.age Profession:self.profession andFriend:self.friend];
    
    [self.tableViewDelegate reloadDataWithItems:self.filteredItems];
  
}


@end
