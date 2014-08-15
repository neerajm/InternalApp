//
//  BIDEmployeeHandbook.m
//  MasterSummerProject
//
//  Created by Nick Woodward on 8/12/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "BIDEmployeeHandbook.h"

@interface BIDEmployeeHandbook ()

@end

@implementation BIDEmployeeHandbook{
    NSURL *url;
    NSMutableArray *isChecked;
    NSArray *pdfURLS;
    BOOL sendEmail;
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
    sendEmail = false;
    self.sendMail.enabled = NO;
    isChecked = [[NSMutableArray alloc] initWithObjects:@"FALSE",@"FALSE",@"FALSE",@"FALSE",@"FALSE",@"FALSE",@"FALSE", nil];
    pdfURLS = [[NSArray alloc] initWithObjects:
               @"http://www.softwaremerchant.com/welcomepacket/W-4%202014.pdf",
               @"http://www.softwaremerchant.com/welcomepacket/I-9.pdf",
               @"http://www.softwaremerchant.com/welcomepacket/Employee%20DD%20Authorization.pdf",
               @"http://www.softwaremerchant.com/welcomepacket/Residency%20Certification%20Form%20DCED-CLGS-06.pdf",
               @"http://www.softwaremerchant.com/welcomepacket/IBC%202014%20Employee%20Enrollment%20Form.pdf",
               @"http://www.softwaremerchant.com/welcomepacket/Dental%20and%20Vision%20SM%202014%20Benefits.pdf",
               @"http://www.softwaremerchant.com/welcomepacket/2014%20Medical%20Plan%20Options.pdf",nil];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(sendEmail == false){
        if(indexPath.row == 0){
            url = [[NSURL alloc]initWithString:@"http://www.softwaremerchant.com/welcomepacket/W-4%202014.pdf"];
        }
        else if(indexPath.row == 1){
            url = [[NSURL alloc]initWithString:@"http://www.softwaremerchant.com/welcomepacket/I-9.pdf"];
            //url = [[NSURL alloc]initWithString:@"http://www.google.com"];

        }
        else if(indexPath.row == 2){
            url = [[NSURL alloc]initWithString:@"http://www.softwaremerchant.com/welcomepacket/Employee%20DD%20Authorization.pdf"];
        }
        else if(indexPath.row == 3){
            url = [[NSURL alloc]initWithString:@"http://www.softwaremerchant.com/welcomepacket/Residency%20Certification%20Form%20DCED-CLGS-06.pdf"];
        }
        else if(indexPath.row == 4){
            url = [[NSURL alloc]initWithString:@"http://www.softwaremerchant.com/welcomepacket/IBC%202014%20Employee%20Enrollment%20Form.pdf"];
        }
        else if(indexPath.row == 5){
            url = [[NSURL alloc]initWithString:@"http://www.softwaremerchant.com/welcomepacket/Dental%20and%20Vision%20SM%202014%20Benefits.pdf"];
        }
        else {
            url = [[NSURL alloc]initWithString:@"http://www.softwaremerchant.com/welcomepacket/2014%20Medical%20Plan%20Options.pdf"];
        }
        [self performSegueWithIdentifier:@"toPDF" sender:url];
    }
    else{
        if([isChecked[indexPath.row] isEqualToString:@"TRUE"]){
            isChecked[indexPath.row]=@"FALSE";
        }
        else{
            isChecked[indexPath.row]=@"TRUE";
        }
        [self.tvPDFs reloadData];
    }
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pdf" forIndexPath:indexPath];
    
    UILabel *pdfLabel = (id)[cell viewWithTag:1];
    if(indexPath.row == 0){
        [pdfLabel setText:@"W-4"];
    }
    else if(indexPath.row == 1){
        [pdfLabel setText:@"I-9"];
    }
    else if(indexPath.row == 2){
        [pdfLabel setText:@"Direct Deposit Authorization"];
    }
    else if(indexPath.row == 3){
        [pdfLabel setText:@"Residency Verification form"];
    }
    else if(indexPath.row == 4){
        [pdfLabel setText:@"Health Care Application"];
    }
    else if(indexPath.row == 5){
        [pdfLabel setText:@"Dental and Vision Application"];
    }
    else{
        [pdfLabel setText:@"Medical Plans"];
    }
    if([isChecked[indexPath.row] isEqualToString: @"TRUE"]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
    
    //cell.textLabel.text = _zips[indexPath.row];
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSURL *url = (NSURL *)sender;
    UIViewController *vc = [segue destinationViewController];
    @try {
        [vc setValue:url forKeyPath:@"url"];
        // Your statements here
    }
    @catch (NSException * e) {
    }
    @finally {
    }
    
    
}




/*- (IBAction)loadpdf:(UIButton *)sender {
    url = [[NSURL alloc]initWithString:@"http://www.google.com"];

    [self performSegueWithIdentifier:@"toPDF" sender:nil];
}*/
- (IBAction)enableEmailMode:(id)sender {
    if(sendEmail == false){
        sendEmail = true;
        self.sendMail.enabled = YES;
        [self.btnSendMail setTitle:@"View PDFs" forState:UIControlStateNormal];
    }
    else{
        sendEmail = false;
        self.sendMail.enabled = NO;
        [self.btnSendMail setTitle:@"Send Mail" forState:UIControlStateNormal];
        for(int i = 0;i<7;i++){
            isChecked[i] = @"FALSE";
        }
        [self.tvPDFs reloadData];

    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)email:(id)sender {
    // Email Subject
    NSString *emailTitle = @"PDF Links";
    // Email Content
    NSMutableString *messageBody;
    messageBody = [[NSMutableString alloc]initWithString: @"Here are the PDFS:\n\n"];
    NSMutableString *placeholder;
    
    for(int i =0;i<7;i++){
        if([isChecked[i] isEqualToString: @"TRUE"]) {
            placeholder = [[NSMutableString alloc]initWithString:pdfURLS[i]];
            [messageBody appendString:placeholder];
            [messageBody appendString:@"\n\n"];
        }
    }

    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = (id)self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}
@end
