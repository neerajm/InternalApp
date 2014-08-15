//
//  SUBXMLParser.h
//  ETutorialMaster
//
//  Created by Software Merchant Inc. on 9/27/13.
//  Copyright (c) 2013 Software Merchant Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SUBUser;

@interface SUBXMLParser : NSObject{
    
    NSMutableString *currentElementValue;
    
    SUBUser *user;
    
   // NSMutableArray *users;
    
    NSMutableString *loginValue;
}
@property(nonatomic,retain) SUBUser *user;
@property(nonatomic,retain)NSMutableArray *users;

-(SUBXMLParser *) initXMLParser;

@end
