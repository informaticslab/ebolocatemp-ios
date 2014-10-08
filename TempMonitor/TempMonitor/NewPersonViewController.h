//
//  NewPersonViewController.h
//  TempMonitor
//
//  Created by jtq6 on 10/8/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface NewPersonViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtNickname;
@property (weak, nonatomic) IBOutlet UITextField *txtCdcId;
@property (strong, nonatomic) Person *person;

- (IBAction)btnAddPersonTouchUp:(id)sender;
- (IBAction)btnCancelTouchUp:(id)sender;


@end
