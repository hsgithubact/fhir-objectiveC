//
//  loadScreenViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-11.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "loadScreenViewController.h"
//#import "InitialSearchTableViewController.h"

@interface loadScreenViewController ()

@end

@implementation loadScreenViewController

@synthesize loadScreenImage = _loadScreenImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)viewDidAppear:(BOOL)animated
{
    sleep(3);
    [self performSegueWithIdentifier:@"loadScreenSegue" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"loadScreenSegue"]) {
        //pass values
        
        //InitialSearchTableViewController *dest = segue.destinationViewController;
        //[dest setTitle:@"Patient Search"];
        //[dest setPatientorMedication:@"Patient"];
        
        //NSLog(@"The title is: %@, and the info is: %@.",dest.locTitle,dest.locInfo);
    }
}

@end
