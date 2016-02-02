//
//  MMMainTableViewCell.h
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APAvatarImageView.h"

@interface MMMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backgraoundImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet APAvatarImageView *imageAvatar;


@end
