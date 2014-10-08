//
//  SecondViewController.m
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "PeopleViewController.h"
#import "NewPersonViewController.h"
#import "AppManager.h"

@interface PeopleViewController ()

@end

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPersonToPeopleViewController:(UIStoryboardSegue *)segue
{
    DebugLog(@"from segue id: %@", segue.identifier);
    if ([segue.sourceViewController isKindOfClass:[NewPersonViewController class]]) {
        DebugLog(@"Unwind segue from NewPersonViewController to PeopleViewController");

        NewPersonViewController *newPersonVC = segue.sourceViewController;
        
        [APP_MGR.dataMgr addPersonWithId:newPersonVC.txtCdcId.text andNickname:newPersonVC.txtNickname.text];

    }
}

- (IBAction)cancelAddPersonToPeopleViewController:(UIStoryboardSegue *)segue
{
    DebugLog(@"from segue id: %@", segue.identifier);
    if ([segue.sourceViewController isKindOfClass:[NewPersonViewController class]]) {
        DebugLog(@"Unwind segue from NewPersonViewController to PeopleViewController");
                
    }
}

@end
