//
//  SettingsViewController.h
//  MasterSummerProject
//
//  Created by Nick Woodward on 8/19/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *tfNewPassword;


@property (weak, nonatomic) IBOutlet UITextField *tfConfirm;


@property (nonatomic, assign) int passwordreset;


- (IBAction)textFieldDoneEditing:(id)sender;


- (IBAction)savebutton:(id)sender;

- (IBAction)backgroundTap:(id)sender;
@end
