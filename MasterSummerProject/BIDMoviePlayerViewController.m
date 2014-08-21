//
//  BIDMoviePlayerViewController.m
//  InternalApp
//
//  Created by Nick Woodward on 8/21/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "BIDMoviePlayerViewController.h"

@interface BIDMoviePlayerViewController ()

@end

@implementation BIDMoviePlayerViewController{
    NSString *embedStr;
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
    [self.wvYouTube loadHTMLString:embedStr baseURL:nil];
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

@end
