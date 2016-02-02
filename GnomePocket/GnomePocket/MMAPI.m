//
//  MMAPI.m
//  BeRepublicMusic
//
//  Created by Juan Miguel Marqués Morilla on 22/1/16.
//  Copyright © 2016 Juan Miguel Marqués Morilla. All rights reserved.
//

#import "MMAPI.h"



@implementation MMAPI

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
    
}

-(void)getJSONDataForAPI:url completionBlock:(void (^)(NSDictionary *jsonDictionary, NSError *error))block{
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *queryURL = [NSURL URLWithString:url];
    
    [[session dataTaskWithURL:queryURL
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                NSDictionary *jsonDictionary = [NSDictionary dictionary];
                
                if (data !=nil) {
                    jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                }
                
                if(jsonDictionary) {
                    block(jsonDictionary, nil);
                    
                } else {
                    NSError *error = [NSError errorWithDomain:@"download_error" code:1
                                                     userInfo:[NSDictionary dictionaryWithObject:@"Can't fetch data" forKey:NSLocalizedDescriptionKey]];
                    block(nil, error);
                }
                
            }] resume];
}

@end
