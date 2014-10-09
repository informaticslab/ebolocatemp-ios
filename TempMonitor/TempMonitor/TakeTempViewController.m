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
    
        if ([APP_MGR.dataMgr.people count] == 0) {
            [self pushAddDefaultUserView];
        }

    
//    if (APP_MGR.agreedWithEula == FALSE) {
//        [self presentEulaModalView];
//    }
//    

    _txtTemperature.delegate = self;

}


-(void)pushAddDefaultUserView
{
    
    [self performSegueWithIdentifier:@"showAddDefaultUser" sender:self];

}

- (void)presentEulaModalView
{
    static BOOL alwaysShowEula = FALSE;
    
    if (APP_MGR.agreedWithEula == TRUE && alwaysShowEula == FALSE)
        return;
    
    // store the data
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *currVersion = [NSString stringWithFormat:@"%@.%@",
                             [appInfo objectForKey:@"CFBundleShortVersionString"],
                             [appInfo objectForKey:@"CFBundleVersion"]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersionEulaAgreed = (NSString *)[defaults objectForKey:@"agreedToEulaForVersion"];
    
    
    // was the version number the last time EULA was seen and agreed to the
    // same as the current version, if not show EULA and store the version number
    if (![currVersion isEqualToString:lastVersionEulaAgreed] || alwaysShowEula) {
        [defaults setObject:currVersion forKey:@"agreedToEulaForVersion"];
        [defaults synchronize];
        DebugLog(@"Data saved");
        DebugLog(@"%@", currVersion);
        
        //
        [self performSegueWithIdentifier:@"displayEulaSegue" sender:self];
    }
    
    
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
