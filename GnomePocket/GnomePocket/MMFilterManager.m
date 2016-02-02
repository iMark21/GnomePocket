//
//  MMFilterManager.m
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMFilterManager.h"
#import "MMGnomeObject.h"

@implementation MMFilterManager

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

-(NSArray *)arrayAgesFromArrayOfGnomes:(NSArray *)array{
    
    
    NSMutableArray *result = [NSMutableArray arrayWithObject:@"All Ages"];
    
    //result addObjectsFromArray:array];
    
    NSArray *ages = [array valueForKey:@"age"];
    
    
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:ages];
    
    NSArray *arrayWithoutDuplicates = [orderedSet array];
    
    arrayWithoutDuplicates = [arrayWithoutDuplicates sortedArrayUsingSelector: @selector(compare:)];
    
    [result addObjectsFromArray:arrayWithoutDuplicates];
    
    return result;
        
}

-(NSArray*)arrayProfessionsFromArrayOfGnomes:(NSArray*)array{
    
    NSMutableArray *result = [NSMutableArray arrayWithObject:@" All Professions"];
    
    for (NSArray *test in [array valueForKey:@"professions"]) {
        
        [result addObjectsFromArray:test];
        
    }
        
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:result];
    
    NSArray *arrayWithoutDuplicates = [orderedSet array];
    
    arrayWithoutDuplicates = [arrayWithoutDuplicates sortedArrayUsingSelector: @selector(compare:)];
    
    return arrayWithoutDuplicates;
    
}

-(NSArray*)arrayFriendsFromArrayOfGnomes:(NSArray*)array{
   
    NSMutableArray *result = [NSMutableArray arrayWithObject:@"All Friends"];
;
    
    for (NSArray *test in [array valueForKey:@"friends"]) {
        
        [result addObjectsFromArray:test];
        
    }
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:result];
    
    NSArray *arrayWithoutDuplicates = [orderedSet array];
    
    arrayWithoutDuplicates = [arrayWithoutDuplicates sortedArrayUsingSelector: @selector(compare:)];
    
    return arrayWithoutDuplicates;
    
    
}

-(NSArray*)gnomeFromArray:(NSArray*)array Age:(NSString*)ageString{


    
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"age == %@", [NSNumber numberWithInt:[ageString intValue]]];
    NSArray *filtered  = [array filteredArrayUsingPredicate:predicate];
    
    return filtered;
        
}

-(NSArray *)gnomeFromArray:(NSArray *)array Profession:(NSString *)professionString{
    
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"professions CONTAINS %@", professionString];
    NSArray *filtered  = [array filteredArrayUsingPredicate:predicate];
    
    return filtered;

    
}

-(NSArray *)gnomeFromArray:(NSArray *)array Friend:(NSString *)friendString{
    
    NSPredicate *predicate =
    [NSPredicate predicateWithFormat:@"friends CONTAINS %@", friendString];
    
    NSArray *filtered  = [array filteredArrayUsingPredicate:predicate];
    
    return filtered;
    
    
}

-(NSArray*)gnomeFromArray:(NSArray*)array Age:(NSString*)ageString  Profession:(NSString*)professionString andFriend:(NSString*)friendString{

    NSPredicate *predicate;
    
    if (friendString == nil) {
        friendString = @"All Friends";
    }
    if (professionString == nil) {
        professionString = @" All Professions";
    }
    if (ageString == nil) {
        ageString = @"All Ages";
    }
    
    if ([friendString isEqualToString:@"All Friends"] && [professionString isEqualToString:@" All Professions"]&&[ageString isEqualToString:@"All Ages"]) {
    
        return array;
    
    }
    
    if ([friendString isEqualToString:@"All Friends"] && [professionString isEqualToString:@" All Professions"]) {
        
        return [self gnomeFromArray:array Age:ageString];
        
    }else if ([friendString isEqualToString:@"All Friends"]  && [ageString isEqualToString:@"All Ages"]){
        
        return [self gnomeFromArray:array Profession:professionString];
        
    }else if ([ageString isEqualToString:@"All Ages"] && [professionString isEqualToString:@" All Professions"]){
        
        return [self gnomeFromArray:array Friend:friendString];
    }else if ([ageString isEqualToString:@"All Ages"]){
        
        predicate =
        [NSPredicate predicateWithFormat:@"professions CONTAINS %@ AND friends CONTAINS %@", [NSNumber numberWithInt:[ageString intValue]],professionString,friendString];
    }else if (professionString == nil){
        
        predicate =
        [NSPredicate predicateWithFormat:@"age == %@ AND friends CONTAINS %@", [NSNumber numberWithInt:[ageString intValue]],professionString,friendString];
    }else if ([friendString isEqualToString:@"All Friends"]){
        
        predicate =
        [NSPredicate predicateWithFormat:@"age == %@ AND professions CONTAINS %@", [NSNumber numberWithInt:[ageString intValue]],professionString,friendString];
    }else{
        
        predicate =
        [NSPredicate predicateWithFormat:@"age == %@ AND professions CONTAINS %@ AND friends CONTAINS %@", [NSNumber numberWithInt:[ageString intValue]],professionString,friendString];
    }
    
    NSArray *filtered  = [array filteredArrayUsingPredicate:predicate];
    
    return filtered;
    
    
}





@end
