//
//  TemperatureReadings.m
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "TemperatureReading.h"

@implementation TemperatureReading


- (id)initWithCoder:(NSCoder *)coder
{
    if ((self = [super init]))
    {
        // decode Person values by key
        _dateTaken = [coder decodeObjectForKey:@"dateTaken"];
        _temp = [coder decodeObjectForKey:@"temp"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    
    // Encode our ivars using string keys
    [coder encodeObject:_dateTaken forKey:@"dateTaken"];
    [coder encodeObject:_temp forKey:@"temp"];

}

+ (TemperatureReading *)initWithTemp:(NSString *)temp
{
    
    TemperatureReading *tempReading = [[TemperatureReading alloc] init];
    
    tempReading.dateTaken = [NSDate date];
    tempReading.temp = [NSString stringWithString:temp];
    
    return tempReading;
    
}


@end
