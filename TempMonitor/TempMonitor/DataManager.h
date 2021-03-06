//
//  DataManager.h
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


@interface DataManager : NSObject

@property(copy) NSMutableArray *people;

-(void)saveDataToDisk;
-(void)loadDataFromDisk;
-(void)dumpData;
-(void)addTestData;
-(Person *)addPersonWithId:(NSString*)cdcId andNickname:(NSString *)nickname;
-(void)addTempReading:(TemperatureReading *)tempReading forPerson:(Person *)person;
-(TemperatureReading *)createTempReading:(NSString *)temp;
-(TemperatureReading *)createTempReading:(NSString *)temp forPerson:(Person *)person;
-(BOOL)onlyOnePersonConfigured;
-(Person *)getOnlyPerson;


@end
