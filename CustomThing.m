//
//  CustomThing.m
//  ManualMemoryManagementDemo
//
//  Created by Steven Shatz on 10/26/14.
//  Copyright (c) 2014 Steven Shatz. All rights reserved.
//

#import "CustomThing.h"

@implementation CustomThing

-(id)init {
    self = [super init];
    if (self) {
        _ctInt = 0;
        _ctString = [[NSString alloc] init];
        _ctArray = [[NSMutableArray alloc] initWithObjects:nil];
    }
    return self;
}

-(void)dealloc {
    NSLog(@"*** In dealloc for CustomThing ***");
    // Note: _ctInt is a primitive data type, so it is not owned and cannot be released here
    [_ctString release];    // release last object that ctString pointed to
    [_ctArray release];     // release last object that ctArray pointed to
    [super dealloc];        // invoke parent class' dealloc method
}

-(int)ctInt {               // getter - increments _ctInt each time it is returned
    return ++_ctInt;
}

-(void)setCtInt:(int)newInt {                   // setter
    // Note: int is a primitive data type, so it cannot be owned. Therefore, no retain or release is needed
    _ctInt = newInt;        // ctInt is set to new object
}

-(NSString *)ctString {     // getter
    return _ctString;
}

-(void)setCtString:(NSString *)newString {      // setter
    [newString retain];     // share ownership of new object
    [_ctString release];    // release previous object that ctString pointed to (OK if pointer was nil)
    _ctString = newString;  // ctString now points to new object
}

-(NSMutableArray *)ctArray {       // getter
    return _ctArray;
}

-(void)setCtArray:(NSMutableArray *)newArray {         // setter
    [newArray retain];      // share ownership of new object
    [_ctArray release];     // release previous object that ctArray pointed to (OK if pointer was nil)
    _ctArray = newArray;    // ctArray now points to new object
}

@end
