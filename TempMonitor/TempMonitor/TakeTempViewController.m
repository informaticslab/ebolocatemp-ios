//
//  FirstViewController.m
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "TakeTempViewController.h"
#import "SelectPersonForTempVC.h"
#import "AppManager.h"


@interface TakeTempViewController ()

@end


@implementation TakeTempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _txtTemperature.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.txtTemperature endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


#pragma mark - Navigation
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"showSelectPersonForTempSegue"])
    {
        SelectPersonForTempVC *selectPersonForTempVC = segue.destinationViewController;
        
        TemperatureReading *newTemp = [APP_MGR.dataMgr createTempReading:self.txtTemperature.text];
        selectPersonForTempVC.temperature = newTemp;
        
        
    }
}



@end
