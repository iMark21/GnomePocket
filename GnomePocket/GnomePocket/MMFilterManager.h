//
//  MMFilterManager.h
//  GnomePocket
//
//  Created by Juan Miguel Marqués Morilla on 1/2/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMFilterManager : NSObject

+(instancetype)sharedInstance;

-(NSArray*)arrayAgesFromArrayOfGnomes:(NSArray*)array;

-(NSArray*)arrayFriendsFromArrayOfGnomes:(NSArray*)array;

-(NSArray*)arrayProfessionsFromArrayOfGnomes:(NSArray*)array;

-(NSArray*)gnomeFromArray:(NSArray*)array Age:(NSString*)ageString  Profession:(NSString*)professionString andFriend:(NSString*)friendString;

@end
