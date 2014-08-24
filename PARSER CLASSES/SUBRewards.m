//
//  SUBRewards.m
//  InternalApp
//
//  Created by Naren on 8/24/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "SUBRewards.h"

@implementation SUBRewards
{

NSString *displaypoints;
}


-(SUBRewards *) initXMLParser{
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
    
    
    
    if([elementName isEqualToString:@"Rewards_Points"]){
        
       displaypoints = currentElementValue;
    }
    currentElementValue=nil;
}


@end


