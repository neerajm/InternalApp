//
//  SettingsViewController.m
//  MasterSummerProject
//
//  Created by Nick Woodward on 8/19/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "SettingsViewController.h"

#import "PasswordXMLParser.h"

#import "BIDUserName.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
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
    // Do any additional setup after loading the view.
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




- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)savebutton:(id)sender {
    
    
    if([_tfNewPassword.text isEqualToString:_tfConfirm.text]){
        
    
    
    NSMutableString *envelopeText=
    
    @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
    
    "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\n"
    
    "  <soap12:Body>\n"
    
    "    <CreateUserAccount xmlns=\"http://tempuri.org/\">\n"
    
    "      <UserID>%@</UserID>\n"
    
    "      <Password>%@</Password>\n"
    
    "      <UpdateIfExists>%@</UpdateIfExists>\n"
    
    "    </CreateUserAccount>\n"
    
    "  </soap12:Body>\n"
    
    "</soap12:Envelope>";
    
        
        BIDUserName *userglobal = [ BIDUserName sharedManager];
    
    envelopeText = [NSMutableString stringWithFormat:envelopeText,userglobal.username, _tfConfirm.text,@"1" ];
    
    
    NSData *envelope = [envelopeText dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url=@"http://www.softwaremerchant.com/onlinecourse.asmx?op=CreateUserAccount";
    
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
    
  PasswordXMLParser*parser=[[PasswordXMLParser alloc]initXMLParser];
    
    [nsXmlParser setDelegate:parser];
    
    
    [nsXmlParser parse];
    
    //Disect XML ressults for user id and password validity
    //[user setValue:currentElementValue forKey:elementName];
    NSString *CreateUserAccount=  [parser valueForKey:@"CreateUserAccountResult"];
    
    
    if([CreateUserAccount isEqualToString:@"Updated User Account for user 'admin'."])
    {
        self.passwordreset = 1; // means valid user
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Password Change" message:@"DONE!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        
        
    }
    else{
        self.passwordreset = 0;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Password Change" message:@"Unsuccessful" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    }
}


- (IBAction)backgroundTap:(id)sender {
    [self.tfNewPassword resignFirstResponder];
    [self.tfConfirm resignFirstResponder];
}
@end
