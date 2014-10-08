//
//  TemperatureReadings.h
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemperatureReading : NSObject <NSCoding>

@property NSDate *dateTaken;
@property NSString *temp;

+ (TemperatureReading *)initWithTemp:(NSString *)temp;

@end
