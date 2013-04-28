//
//  ViewController.m
//  GitTest3
//
//  Created by Hervé PEROTEAU on 28/04/13.
//  Copyright (c) 2013 Hervé PEROTEAU. All rights reserved.
//

#import "ViewController.h"
#import "TestFlight.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)testEvent:(id)sender {
    
    [TestFlight passCheckpoint:@"TEST_EVENT"];
    [TestFlight flush];
        
    
}

-(IBAction)crashAction:(id)sender {
    
    [TestFlight passCheckpoint:@"crashAction"];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(fake_selector:)
                                   userInfo:nil
                                    repeats:NO];
    
    [TestFlight passCheckpoint:@"crashAction ended"];
    [TestFlight flush];
}


@end
