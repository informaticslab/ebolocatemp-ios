//
//  FirstViewController.m
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "TakeTempViewController.h"
#import "SelectPersonTableViewController.h"
#import "SubmitViewController.h"
#import "AppManager.h"


@interface TakeTempViewController ()

@end

SelectPersonTableViewController *selectPersonVC;

@implementation TakeTempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"showSubmitViewSegue"])
    {
        SubmitViewController *submitVC = segue.destinationViewController;
        submitVC.person = selectPersonVC.selectedPerson;
        
        TemperatureReading *newTemp = [APP_MGR.dataMgr addTempReading:self.txtTemperature.text forPerson:selectPersonVC.selectedPerson];
        submitVC.tempReading = newTemp;
        
        
    } else if ([segue.identifier isEqualToString:@"embedSelectPersonTVC"]) {
        selectPersonVC = (SelectPersonTableViewController *) [segue destinationViewController];
    }
}



@end
