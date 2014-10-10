//
//  FirstViewController.h
//  TempMonitor
//
//  Created by jtq6 on 10/7/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakeTempViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtTemperature;
- (IBAction)btnDoneTouch:(id)sender;

@end

