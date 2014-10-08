//
//  SelectPersonTableViewController.h
//  TempMonitor
//
//  Created by jtq6 on 10/8/14.
//  Copyright (c) 2014 CDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface SelectPersonTableViewController : UITableViewController

@property(weak, nonatomic) Person *selectedPerson;

@end
