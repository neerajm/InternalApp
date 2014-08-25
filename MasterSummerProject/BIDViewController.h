//
//  BIDViewController.h
//  MasterSummerProject
//
//  Created by Software Merchant Inc. Mathur on 8/10/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kUsernameKey  @"labeluserName"

@interface BIDViewController : UIViewController

-(IBAction)login:(id)sender;

@property(strong,nonatomic) IBOutlet UITextField *username;

@property (strong, nonatomic) NSString *userName;

@property (strong, nonatomic) NSString *password;

@property (weak, nonatomic) IBOutlet UITextField *labeluserName;

@property (weak, nonatomic) IBOutlet UITextField *labelpassword;

@property int validateduser;
- (IBAction)pressbutton:(id)sender;

- (IBAction)control:(id)sender;

-(void)loadUserDefaults;

@end
