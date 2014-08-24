//
//  PasswordXMLParser.m
//  InternalApp
//
//  Created by Monica Mathur on 8/24/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "PasswordXMLParser.h"

@implementation PasswordXMLParser {
    
    NSString *CreateUserAccountResult;
}


-(PasswordXMLParser *) initXMLParser{
    [super self];

    return self;
}



-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if(!currentElementValue){
        currentElementValue=[[NSMutableString alloc]initWithString:string];
    }else{
        [currentElementValue appendString:string];
    }
    NSLog(@"Processing value for: %@",string);
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    
    
    if([elementName isEqualToString:@"CreateUserAccountResult"]){
       
        CreateUserAccountResult = currentElementValue;
    }
    currentElementValue=nil;
}


@end
