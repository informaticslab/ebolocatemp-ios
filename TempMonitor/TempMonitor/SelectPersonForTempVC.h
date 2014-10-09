//
//  SelectPersonForTempVC.h
//  TempMonitor
//
//  Created by jtq6 on 10/9/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemperatureReading.h"

@interface SelectPersonForTempVC : UIViewController

@property(nonatomic, strong) TemperatureReading *temperature;
@property(weak, nonatomic) IBOutlet UIButton *btnSubmit;

@end
