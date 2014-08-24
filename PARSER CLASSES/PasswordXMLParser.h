//
//  PasswordXMLParser.h
//  InternalApp
//
//  Created by Monica Mathur on 8/24/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordXMLParser : NSObject {
    
        NSMutableString *currentElementValue;
}


-(PasswordXMLParser *) initXMLParser;

@end
