//
//  BIDDetailPDF.m
//  MasterSummerProject
//
//  Created by Software Merchant Inc. on 8/13/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "BIDDetailPDF.h"

@interface BIDDetailPDF ()

@end

@implementation BIDDetailPDF{
    NSURL *url;
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
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
    [self.wvPDF loadRequest:request];
    self.wvPDF.scalesPageToFit=YES;
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
