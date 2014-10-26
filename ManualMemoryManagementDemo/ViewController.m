//
//  ViewController.m
//  ManualMemoryManagementDemo
//
//  Created by Steven Shatz on 10/26/14.
//  Copyright (c) 2014 Steven Shatz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<100; ++i) {
    
        CustomThing *newThing = [[self createACustomThing] retain];  // We do not need to share ownership of newThing here because createACustomThing
                                                                     // specified autoRelease. But since that can change in the future, it is better
                                                                     // to be safe than sorry and do the extra retain now
        NSLog(@"newThing's array contains: ");
        for (int i=0; i < newThing.ctArray.count; ++i) {
            NSLog(@"%@", newThing.ctArray[i]);
        }
        
        [newThing release];
    }
    
    NSLog(@"\n*** Exiting viewDidLoad ***");
}

-(CustomThing *)createACustomThing {
    NSLog(@"*** In createACustomThing ***\n");
    
    CustomThing *myCustomThing = [[[CustomThing alloc] init] autorelease];    // alloc/init - we own the new object and set it for delayed release
    
    // Dot notation is shorthand for a property's getter or setter:
    //      getter: myCustomThing.ctInt is same as [myCustomThing ctInt]
    //      setter: myCustomThing.ctString = [...] is same as [myCustomThing setCtString:...]
    
    myCustomThing.ctString = [NSString stringWithFormat:@"%d. %@",
                              myCustomThing.ctInt,
                              @" This is the string for myCustomThing."];
    // stringWithFormat creates a new string, but we do not own that string. NSString owns it.
    
    NSString *secondString = [[NSString alloc] initWithFormat:@"%d. %@",
                              myCustomThing.ctInt,
                              @" This is the second string for myCustomThing."];
    
    NSString *thirdString = [[NSString alloc] initWithFormat:@"%d. %@",
                              myCustomThing.ctInt,
                              @" This is the third string for myCustomThing."];
    
    [myCustomThing.ctArray addObject:myCustomThing.ctString];
    [myCustomThing.ctArray addObject:secondString];
    [myCustomThing.ctArray addObject:thirdString];
    
    [secondString release];
    [thirdString release];
    
    return myCustomThing;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
