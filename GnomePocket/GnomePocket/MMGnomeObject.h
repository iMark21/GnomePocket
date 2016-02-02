//
//  gnomeObject.h
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMGnomeObject : NSObject

@property (nonatomic,strong) NSString *identificator;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,strong) NSArray *friends;
@property (nonatomic,strong) NSString *hair_color;
@property (nonatomic,assign) float height;
@property (nonatomic,assign) float weight;
@property (nonatomic,strong) NSArray *professions;
@property (nonatomic,strong) NSString *image;


-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

-(void)setValuesWithDictionary:(NSDictionary*)dictionary;

-(NSDictionary*)dictionaryForObject:(MMGnomeObject*)gnome;

@end
