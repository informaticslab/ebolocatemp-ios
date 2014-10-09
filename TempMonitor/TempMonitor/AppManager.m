//
//  AppManager.m
//  pedigree
//
//  Created by jtq6 on 3/21/13.
//  Copyright (c) 2013 CDC Informatics R&D Lab. All rights reserved.
//

#import "AppManager.h"
#import "AppDelegate.h"
static AppManager *sharedAppManager = nil;

@implementation AppManager


#pragma mark Singleton Methods
+ (id)singletonAppManager {
	@synchronized(self) {
		if(sharedAppManager == nil)
			sharedAppManager = [[self alloc] init];
	}
    
	return sharedAppManager;

}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if(sharedAppManager == nil)  {
			sharedAppManager = [super allocWithZone:zone];
			return sharedAppManager;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}


- (id)init {
    
	if ((self = [super init]))
    {
		self.appName = @"Ebola Temperature Monitor";
        self.agreedWithEula = FALSE;
        
        DebugLog(@"%@ %@ is loading....", self.appName, [self getAppVersion]);
        DebugLog(@"Device System Name = %@", [self getDeviceSystemName]);
        DebugLog(@"Device System Version = %@", [self getDeviceSystemVersion]);
        DebugLog(@"Device Model = %@", [self getDeviceModel]);
        
        [self processDebugSettings];

        
        // Do any additional setup after loading the view.
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        
        [self.locationManager startUpdatingLocation];
        

        self.dataMgr = [[DataManager alloc  ]init];
        
    }
	return self;

}

-(BOOL)isDeviceIpad
{
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        return YES;
        
    return NO;
}

-(NSString *)getDeviceModel
{
    UIDevice *device = [UIDevice currentDevice];
    return [device model];
}

-(NSString *)getDeviceSystemVersion
{
    UIDevice *device = [UIDevice currentDevice];
    return [device systemVersion];
}

-(NSString *)getDeviceSystemName
{
    UIDevice *device = [UIDevice currentDevice];
    return [device systemName];
}



-(NSString *)getAppVersion
{
    
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *currVersion = [NSString stringWithFormat:@"%@.%@",
                             [appInfo objectForKey:@"CFBundleShortVersionString"],
                             [appInfo objectForKey:@"CFBundleVersion"]];

    return currVersion;
    
}

- (NSString *)deviceLocation
{
    NSString *theLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
    return theLocation;
}



//-(BOOL)isInternetReachable
//{
//    
//    NSString *remoteHostName = @"www.google.com";
//    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
//    [self.hostReachability startNotifier];
//    //[self updateInterfaceWithReachability:self.hostReachability];
//
//    
//}
-(BOOL)isDebugInfoEnabled
{
    // Get user preference
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL enabled = [defaults boolForKey:@"enableDebugInfo"];
    return enabled;
    
}

- (void) deleteAllObjects: (NSString *) entityDescription  {
    
}


-(void)processDebugSettings
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"DeleteDatabaseOnRestart"]) {
        
        
    }
}


- (void)presentEulaModalView
{
    
    if (_agreedWithEula == TRUE)
    return;
    
    // store the data
    NSString *currVersion = [self getAppVersion];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersionEulaAgreed = (NSString *)[defaults objectForKey:@"agreedToEulaForVersion"];
    
    
    // was the version number the last time EULA was seen and agreed to the
    // same as the current version, if not show EULA and store the version number
    if (![currVersion isEqualToString:lastVersionEulaAgreed])
    {
        [defaults setObject:currVersion forKey:@"agreedToEulaForVersion"];
        [defaults synchronize];
        DebugLog(@"Data saved");
        DebugLog(@"%@", currVersion);
        
        // Create the modal view controller
        // EulaViewController *eulaVC = [[EulaViewController alloc] initWithNibName:@"EulaViewController" bundle:nil];
        
        // we are the delegate that is responsible for dismissing the help view
//        eulaVC.delegate = self;
 //       eulaVC.modalPresentationStyle = UIModalPresentationPageSheet;
 //       [self presentModalViewController:eulaVC animated:YES];
        
    }
    
    
}




@end
