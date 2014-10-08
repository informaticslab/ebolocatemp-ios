//
//  AppManager.h
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "Debug.h"
#import "DataManager.h"
#include "Reachability.h"

#define APP_MGR ((AppManager *)[AppManager singletonAppManager])

@interface AppManager : NSObject 

@property (nonatomic, strong) NSString *appName;
@property BOOL agreedWithEula;

// Core Data properties
@property (strong, nonatomic) DataManager *dataMgr;
@property (strong, nonatomic) Reachability *hostReachability;
@property (nonatomic,retain) CLLocationManager *locationManager;


+ (id)singletonAppManager;
-(BOOL)isDebugInfoEnabled;
-(BOOL)isDeviceIpad;

-(NSString *)getDeviceModel;
-(NSString *)getDeviceSystemVersion;
-(NSString *)getDeviceSystemName;
-(NSString *)getAppVersion;

-(NSString *)deviceLocation;

@end
