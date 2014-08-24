//
//  BIDUserName.m
//  InternalApp
//
//  Created by Nick2 on 8/24/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "BIDUserName.h"

@implementation BIDUserName


+ (id)sharedManager {
    static BIDUserName *sharedMyManager = nil;
    if (sharedMyManager == nil)
        sharedMyManager = [[self alloc] init];
    
    return sharedMyManager;
}


@end
