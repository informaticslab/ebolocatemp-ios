//
//  Person.m
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "Person.h"

@implementation Person


- (id)initWithCoder:(NSCoder *)coder
{
    if ((self = [super init]))
    {
        // decode Person values by key
        _nickname = [coder decodeObjectForKey:@"nickname"];
        _cdcId = [coder decodeObjectForKey:@"cdcId"];
        _tempReadings = [coder decodeObjectForKey:@"tempReadings"];
    }

    return self;

}

- (void)encodeWithCoder:(NSCoder *)coder
{
    // Encode our ivars using string keys
    [coder encodeObject:_nickname forKey:@"nickname"];
    [coder encodeObject:_cdcId forKey:@"cdcId"];
    [coder encodeObject:_tempReadings forKey:@"tempReadings"];

}

+ (Person *)initWithCdcId:(NSString *)cdcId andNickname:(NSString *)nickname
{
    
    Person *person = [[Person alloc] init];
    
    person.cdcId = [NSString stringWithString:cdcId];
    person.nickname = [NSString stringWithString:nickname];
    
    return person;

}

-(void)addTempReading:(TemperatureReading *)reading
{
    if (_tempReadings == nil) {
        _tempReadings = [[NSMutableArray alloc] init];
    }
    
    [_tempReadings addObject:reading];
    
}



@end
