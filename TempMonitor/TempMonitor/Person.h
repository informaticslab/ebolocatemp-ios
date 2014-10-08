//
//  Person.h
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TemperatureReading.h"

@interface Person : NSObject<NSCoding>

@property NSString *nickname;
@property NSString *cdcId;
@property NSMutableArray *tempReadings;

+ (Person *)initWithCdcId:(NSString *)cdcId andNickname:(NSString *)nickname;
-(void)addTempReading:(TemperatureReading *)reading;


@end
