//
//  SUBXMLParser.m
//  ETutorialMaster
//
//  Created by Software Merchant Inc. on 9/27/13.
//  Copyright (c) 2013 Software Merchant Inc.. All rights reserved.
//

#import "SUBXMLParser.h"
#import "SUBUser.h"
#import "BIDUserName.h"

@implementation SUBXMLParser
@synthesize user,users;

-(SUBXMLParser *) initXMLParser {
    
    [super self];
    users=[[NSMutableArray alloc]init];
    return self;
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"IsUserValidResult"]){
        
        user=[[SUBUser alloc]init];
    }
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
       
    if([elementName isEqualToString:@"IsUserValidResult"]){
        loginValue=[[NSMutableString alloc]initWithString:currentElementValue];
        
    }else if([elementName isEqualToString:@"DeviceTokenName"]){
        BIDUserName *user2 = [BIDUserName sharedManager];
        if(user2.tokenList == nil){
            user2.tokenList = [[NSMutableArray alloc]init];
        }
        [user2.tokenList addObject:currentElementValue];
    }

    currentElementValue=nil;
}


@end
