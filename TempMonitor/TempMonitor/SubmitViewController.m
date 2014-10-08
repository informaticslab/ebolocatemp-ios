//
//  SubmitViewController.m
//  TempMonitor
//
//  Created by jtq6 on 10/8/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "SubmitViewController.h"
#import "AppManager.h"

@interface SubmitViewController ()

@end

@implementation SubmitViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm:ss"];
    

    _lblPerson.text = [NSString stringWithFormat:@"For person %@ with CDC ID %@",_person.nickname, _person.cdcId];
    _lblTemperatureInfo.text = [NSString stringWithFormat:@"With temperature of %@",_tempReading.temp];
    
    _lblTimestampInfo.text = [NSString stringWithFormat:@"Taken at %@",[formatter stringFromDate:_tempReading.dateTaken]];

}

-(NSData *)jsonTemperatureReadingData
{
    // NSDictionary for testing.
    NSDictionary *tempReadingDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.person.cdcId, @"CDCID",
                                           self.tempReading.temp, @"temp", @"thirdValue", @"thirdKey", nil];
    
    if ([NSJSONSerialization isValidJSONObject:tempReadingDictionary]) {
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tempReadingDictionary options:NSJSONWritingPrettyPrinted error:&error];
        
        if (error == nil && jsonData != nil) {
            return jsonData;
        } else {
            NSLog(@"Error creating JSON data: %@", error);
            return nil;
        }
        
    } else {
        
        NSLog(@"tempReadingDictionary is not a valid JSON object.");
        return nil;
    }
}


- (void)submitTempReadingToCdc
{
    NSData *jsonData = [self jsonTemperatureReadingData];  // Method shown below.
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    DebugLog(@"%@", jsonString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.myDomain.com/myscript.php"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", [jsonData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:jsonData];
    
    NSURLResponse *response = nil;
    NSError *requestError = nil;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    
    if (requestError == nil) {
        NSString *returnString = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
        NSLog(@"returnString: %@", returnString);
    } else {
        NSLog(@"NSURLConnection sendSynchronousRequest error: %@", requestError);
    }
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

@end
