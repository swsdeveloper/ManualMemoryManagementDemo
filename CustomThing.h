//
//  CustomThing.h
//  ManualMemoryManagementDemo
//
//  Created by Steven Shatz on 10/26/14.
//  Copyright (c) 2014 Steven Shatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface CustomThing : NSObject {
    
    // Define properties manually instead of through @property and @synthesize
    // _ instance variables hold the current value of each property
    // property names are the same as their instance variable, but without the lead underscore (eg: _ctString represents the ctString property)
    // This type of definition is equivalent to using @property (assign, nonatomic)
    
    int _ctInt;     // Encapsulate primitive data type within object by making it a property of that object
    NSString *_ctString;
    NSMutableArray *_ctArray;
    
}

-(id)init;
-(void)dealloc;

-(int)ctInt;
-(void)setCtInt:(int)newInt;

-(NSString *)ctString;
-(void)setCtString:(NSString *)newString;

-(NSMutableArray *)ctArray;
-(void)setCtArray:(NSMutableArray *)newArray;

@end
