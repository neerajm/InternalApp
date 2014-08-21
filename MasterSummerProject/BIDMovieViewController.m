//
//  BIDMovieViewController.m
//  InternalApp
//
//  Created by Nick Woodward on 8/21/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "BIDMovieViewController.h"

@interface BIDMovieViewController ()

@end

@implementation BIDMovieViewController{
    NSArray *names;
    NSArray *movieURLs;
}

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
    return 8;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"toPlayer" sender:[[NSNumber alloc]initWithInt:indexPath.row]];
    
    /*NSURL *url=[NSURL URLWithString:movieURLs[indexPath.row]];
    MPMoviePlayerController *movie;
    movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [movie.view setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    [self.view addSubview:movie.view];
    [movie setScalingMode:MPMovieScalingModeAspectFit];
    
    movie.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    movie.movieSourceType = MPMovieSourceTypeStreaming;
    
    [movie play];*/
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"video" forIndexPath:indexPath];
    UILabel *movieNameLabel = (id)[cell viewWithTag:1];
    movieNameLabel.text = names[indexPath.row];
    
    return cell;
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
    names = [[NSArray alloc]initWithObjects:@"Neeraj Mathawan",
             @"Steve Burdick",
             @"Cassandra Middleton",
             @"Malavika Mathur",
             @"Nick Woodward",
             @"Lirio Torres",
             @"Neran Mathawan",
             @"Kartik Rao",
             nil];
    
    movieURLs = [[NSArray alloc]initWithObjects:@"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/qG0ejag253w\" frameborder=\"0\" allowfullscreen></iframe>",
             @"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/wrMg12tjz_c\" frameborder=\"0\" allowfullscreen></iframe>",
             @"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/UcqpOINQJgI\" frameborder=\"0\" allowfullscreen></iframe>",
             @"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/3L9NfCyhDpM\" frameborder=\"0\" allowfullscreen></iframe>",
             @"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/X9pMvvlfeTs\" frameborder=\"0\" allowfullscreen></iframe>",
             @"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/jLCZz4eeAn4\" frameborder=\"0\" allowfullscreen></iframe>",
             @"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/PRIvqrAT2ZA\" frameborder=\"0\" allowfullscreen></iframe>",
             @"<iframe width=\"259\" height=\"166\" src=\"http://www.youtube.com/embed/Im1fF2h8KbU\" frameborder=\"0\" allowfullscreen></iframe>",
             nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSNumber *index = sender;

    UIViewController *vc = [segue destinationViewController];
    if([segue.identifier isEqualToString:@"toPlayer"]){
        [vc setValue:movieURLs[[index intValue]] forKey:@"embedStr"];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
    
    
@end
