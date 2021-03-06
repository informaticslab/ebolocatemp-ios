//
//  SubmitViewController.m
//  TempMonitor
//
//  Created by jtq6 on 10/8/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "SubmitViewController.h"
#import "AppManager.h"

#define EBOLOCATEMP_URL @"http://tempmonitor.phiresearchlab.org/ebolocatemp/api/record"

@interface SubmitViewController ()

@end



@implementation SubmitViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

    
    _lblPerson.text = [NSString stringWithFormat:@"For %@ with CDC ID %@",_person.nickname, _person.cdcId];
    _lblTemperatureInfo.text = [NSString stringWithFormat:@"With temperature of %@%@",_tempReading.temp, @"\u00B0"];
    
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM'-'dd'-'yyyy'"];
    NSString *date = [formatter stringFromDate:_tempReading.dateTaken];
    
    [formatter setDateFormat:@"HH':'mm':'ss'"];
    NSString *time = [formatter stringFromDate:_tempReading.dateTaken];
    
    _lblTimestampInfo.text = [NSString stringWithFormat:@"Taken on %@ at %@", date, time];
    
    [self submitTempReadingToCdc];

}


-(NSData *)jsonTemperatureReadingData
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    NSString *timestamp = [formatter stringFromDate:_tempReading.dateTaken];
    

    // NSDictionary for testing
    NSDictionary *tempReadingDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.person.cdcId, @"cdcId",
                                           self.tempReading.temp, @"temp",
                                           [APP_MGR deviceLocation], @"loc",
                                           timestamp, @"timestamp",
                                           nil];
    
    if ([NSJSONSerialization isValidJSONObject:tempReadingDictionary]) {
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:tempReadingDictionary options:0 error:&error];
        
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
    
    NSLog(@"Submitting JSON = %@", jsonString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:EBOLOCATEMP_URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response,
//                                               NSData *data, NSError *connectionError)
//     {
//         if (data.length > 0 && connectionError == nil)
//         {
//             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
//                                                                      options:0
//                                                                        error:NULL];
////             self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
////             self.greetingContent.text = [greeting objectForKey:@"content"];
//         }
//     }];
//



- (IBAction)btnDoneTouchUp:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
