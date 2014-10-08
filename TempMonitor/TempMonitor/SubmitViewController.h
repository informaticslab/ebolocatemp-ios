//
//  SubmitViewController.h
//  TempMonitor
//
//  Created by jtq6 on 10/8/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "TemperatureReading.h"
#import "Person.h"

@interface SubmitViewController : UIViewController

@property (weak,nonatomic) Person *person;
@property (weak,nonatomic) TemperatureReading *tempReading;
@property (nonatomic,retain) CLLocationManager *locationManager;


@property (weak, nonatomic) IBOutlet UILabel *lblPerson;
@property (weak, nonatomic) IBOutlet UILabel *lblTemperatureInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblTimestampInfo;

@end
