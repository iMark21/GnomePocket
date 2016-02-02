//
//  gnomeObject.m
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMGnomeObject.h"
#import <objc/runtime.h>

 
@implementation MMGnomeObject

-(instancetype)initWithDictionary:(NSDictionary*)dictionary{
    
    
    if (self = [super init]) {
        
        [self setValuesWithDictionary:dictionary];
        
    }
    
    return self;
}

-(void)setValuesWithDictionary:(NSDictionary*)dictionary{

    self.identificator = [dictionary objectForKey:@"id"];
    self.name = [dictionary objectForKey:@"name"];
    self.age = [[dictionary objectForKey:@"age"]intValue];
    self.friends = [dictionary objectForKey:@"friends"];
    self.hair_color = [dictionary objectForKey:@"hair_color"];
    self.height = [[dictionary objectForKey:@"height"]floatValue];
    self.weight = [[dictionary objectForKey:@"weight"]floatValue];
    self.professions = [dictionary objectForKey:@"professions"];
    self.image = [dictionary objectForKey:@"thumbnail"];
    
    
}

-(NSDictionary*)dictionaryForObject:(MMGnomeObject*)gnome{
    
    NSDictionary *dictionary = @{@"Identificator": gnome.identificator ,@"Name":gnome.name,@"Age":[NSString stringWithFormat:@"%d",gnome.age],@"Friends":gnome.friends,@"Hair Color":gnome.hair_color,@"Height":@(gnome.height),@"Weight":@(gnome.weight),@"Professions":gnome.professions};
    
    return dictionary;
    
}


@end
