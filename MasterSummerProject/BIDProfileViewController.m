//
//  BIDProfileViewController.m
//  InternalApp
//
//  Created by Nick Woodward on 8/21/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "BIDProfileViewController.h"
#import "SUBRewards.h"

@interface BIDProfileViewController ()

@end

@implementation BIDProfileViewController
{
    NSMutableData *responseData;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationItem.leftBarButtonItem = backButton;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSMutableString *envelopeText=
    
    @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
    
    "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\n"
    
    "  <soap12:Body>\n"
    
    "    <getRewardPointsForUser xmlns=\"http://tempuri.org/\">\n"
    
    "      <UserID>%@</UserID>\n"
    
    //    "      <Password>%@</Password>\n"
    
    "      <UpdateIfExists>%@</UpdateIfExists>\n"
    
    "    </getRewardPointsForUser>\n"
    
    "  </soap12:Body>\n"
    
    "</soap12:Envelope>";
    
    
    envelopeText = [NSMutableString stringWithFormat:envelopeText,@"admin"];
    
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url=@"http://www.softwaremerchant.com/onlinecourse.asmx?op=getRewardPointsForUser";
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:envelope];
    [request setValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d",[envelope length]] forHTTPHeaderField:@"Content-Length"];
    
    NSURLConnection *connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if(connection)
        responseData=[NSMutableData data];
    else
        NSLog(@"NSURLConnection initWithRequest: Failed to return a connection");
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    //reponse: webservice is ready to send respond
    
    [responseData setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

//receive data: this is where data is received in how many ever parts there are. we need to concantinate them

{
    [responseData appendData:data];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error

//if the web service is down or any internet issue rises, the message below will show up

{
    NSLog(@"connection didFailWithError: %@ %@",
          error.localizedDescription,
          
          [error.userInfo objectForKey:NSURLErrorFailingURLStringErrorKey]);
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection

//done sending data

{
    // extract result using regular expression (only as an example)
    // this is not a good way to do it; should use XPath queries with XML DOM such as GDataXMLDocument
    NSString *responseText = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",responseText);
    [self doParse:responseData];
    
}

-(void)doParse:(NSData *)data{
    NSXMLParser *nsXmlParser=[[NSXMLParser alloc]initWithData:data];
    
    SUBRewards*parser=[[SUBRewards alloc]initXMLParser];
    
    [nsXmlParser setDelegate:parser];
    
    
    [nsXmlParser parse];
    
    //Disect XML ressults for user id and password validity
    //[user setValue:currentElementValue forKey:elementName];
    NSString *redeemRewards=  [parser valueForKey:@"getRewardPointsForUserResult"];
    
    
    if([redeemRewards isEqualToString:@"1"])
    {
        self.redeemButton= 1; // means valid user
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Password Change" message:@"DONE!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
        
    }
    else{
        self.redeemButton = 0;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Password Change" message:@"Unsuccessful" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    }
}



-(void)goBack {
    [self performSegueWithIdentifier:@"goBack" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
