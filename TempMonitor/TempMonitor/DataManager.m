//
//  DataManager.m
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import "DataManager.h"

#define DATA_FILE_PATH @"~/Documents/ebola_temp_mon_data"

@implementation DataManager


- (void)saveDataToDisk
{
    
    NSString *path = DATA_FILE_PATH;
    path = [path stringByExpandingTildeInPath];
    
    NSMutableDictionary *rootObject;
    rootObject = [NSMutableDictionary dictionary];
    
    [rootObject setValue:_people forKey:@"people"];
    
    [NSKeyedArchiver archiveRootObject:rootObject toFile:path];
    
}

- (void)loadDataFromDisk
{
    // write out home directory
    NSLog(@"HOME > %@", NSHomeDirectory());    
    NSString *path = DATA_FILE_PATH;
    path = [path stringByExpandingTildeInPath];
    
    NSMutableDictionary *rootObject;
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if ([rootObject valueForKey:@"people"]) {
        _people = [rootObject valueForKey:@"people"];
    }
}

-(Person *)addPersonWithId:(NSString*)cdcId andNickname:(NSString *)nickname
{
    
    Person *newPerson = [Person initWithCdcId:cdcId andNickname:nickname];
    
    if (_people == nil) {
        _people = [[NSMutableArray alloc] init];
    }
    
    [_people addObject:newPerson];
    
    return newPerson;

}

-(BOOL)onlyOnePersonConfigured
{
    if ((_people != nil) && ([_people count] == 1))
        return YES;
    else
        return NO;
}

-(Person *)getOnlyPerson
{
    if (_people == nil)
        return nil;

    Person *onlyPerson = [_people objectAtIndex:0];

    return onlyPerson;
    
}

-(void)deletePerson
{
    
    
}

-(void)addTempReading:(TemperatureReading *)tempReading forPerson:(Person *)person
{
    
    [person addTempReading:tempReading];
    
}

-(TemperatureReading *)createTempReading:(NSString *)temp forPerson:(Person *)person
{
    
    TemperatureReading *tempReading = [TemperatureReading initWithTemp:temp];
    [person addTempReading:tempReading];
    
    return tempReading;
    
}

-(TemperatureReading *)createTempReading:(NSString *)temp
{
    
    TemperatureReading *tempReading = [TemperatureReading initWithTemp:temp];
    return tempReading;
    
}



-(void)addTestData
{
    Person *john, *sally;
    
    john = [self addPersonWithId:@"123459" andNickname:@"Jim"];
    [self createTempReading:@"98.6" forPerson:john];
    [self createTempReading:@"98.7" forPerson:john];
    [self createTempReading:@"99.1" forPerson:john];
    [self createTempReading:@"99.4" forPerson:john];
    [self createTempReading:@"99.7" forPerson:john];
    sally = [self addPersonWithId:@"124429" andNickname:@"Jane"];
    [self createTempReading:@"98.5" forPerson:sally];
    [self createTempReading:@"98.8" forPerson:sally];
    [self createTempReading:@"99.2" forPerson:sally];
    [self createTempReading:@"99.3" forPerson:sally];
    [self createTempReading:@"99.6" forPerson:sally];
    
    [self saveDataToDisk];

}

-(void)dumpData
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm:ss"];
    
    for (Person *person in _people) {
        NSLog(@"Found person with id %@ and nickname %@ ", person.cdcId, person.nickname);
        for (TemperatureReading *reading in person.tempReadings) {
            NSLog(@"\tReading on %@ was %@",[formatter stringFromDate:reading.dateTaken],reading.temp);
            
        }
    }
    
}


@end
