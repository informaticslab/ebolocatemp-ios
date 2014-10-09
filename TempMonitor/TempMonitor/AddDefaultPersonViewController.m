//
//  AddDefaultPersonViewController.m
//  TempMonitor
//
//  Created by jtq6 on 10/9/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "AddDefaultPersonViewController.h"
#import "AppManager.h"

@interface AddDefaultPersonViewController ()

@end

@implementation AddDefaultPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _txtCdcId.delegate = self;
    _txtNickname.delegate = self;
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAddpersonTouchUp:(id)sender
{
    if ([_txtNickname.text length] != 0 && [_txtCdcId.text  length] != 0) {
        [APP_MGR.dataMgr addPersonWithId:_txtCdcId.text andNickname:_txtNickname.text];

        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Default User"
                                                        message:@"In order to use the CDC Temp Monitor app you must add a default user with a nickname and a valid CDC ID."
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];

        
    }

    
}
@end
