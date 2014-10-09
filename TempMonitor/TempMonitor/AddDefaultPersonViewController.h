//
//  AddDefaultPersonViewController.h
//  TempMonitor
//
//  Created by jtq6 on 10/9/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface AddDefaultPersonViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtNickname;
@property (weak, nonatomic) IBOutlet UITextField *txtCdcId;
@property (strong, nonatomic) Person *person;


- (IBAction)btnAddpersonTouchUp:(id)sender;

@end
