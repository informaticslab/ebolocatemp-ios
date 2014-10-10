//
//  EulaVC.h
//  retro
//
//  Created by jtq6 on 9/10/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EulaVC : UIViewController<UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *btnAgree;
@property (weak, nonatomic) IBOutlet UILabel *lblAppNameVersion;

- (IBAction)btnAcceptTouchUp:(id)sender;

@end
