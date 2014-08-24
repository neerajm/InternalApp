//
//  BIDUserName.h
//  InternalApp
//
//  Created by Nick2 on 8/24/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDUserName : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *deviceToken;
@property (nonatomic, strong) NSMutableArray *tokenList;

+ (id)sharedManager;
@end
