//
//  BIDViewController.h
//  MasterSummerProject
//
//  Created by Monica Mathur on 8/10/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end
