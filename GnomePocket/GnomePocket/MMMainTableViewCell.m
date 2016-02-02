//
//  MMMainTableViewCell.m
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMMainTableViewCell.h"

@implementation MMMainTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.imageAvatar.borderColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
