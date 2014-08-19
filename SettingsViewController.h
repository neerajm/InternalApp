//
//  SettingsViewController.h
//  MasterSummerProject
//
//  Created by Nick Woodward on 8/19/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tfNewPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfConfirm;

@end
