//
//  SelectPersonForTempVC.m
//  TempMonitor
//
//  Created by jtq6 on 10/9/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "SelectPersonForTempVC.h"
#import "SelectPersonTableViewController.h"
#import "SubmitViewController.h"
#import "AppManager.h"

@interface SelectPersonForTempVC ()

@end

SelectPersonTableViewController *selectPersonVC;

@implementation SelectPersonForTempVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
        submitVC.tempReading = _temperature;
        

        [APP_MGR.dataMgr addTempReading:_temperature forPerson:selectPersonVC.selectedPerson];
        submitVC.person = selectPersonVC.selectedPerson;
        
    } else if ([segue.identifier isEqualToString:@"embedSelectPersonTVC"]) {
        selectPersonVC = (SelectPersonTableViewController *) [segue destinationViewController];
    }
}

@end
