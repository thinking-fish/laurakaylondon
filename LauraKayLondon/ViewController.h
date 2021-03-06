//
//  ViewController.h
//  LauraKayLondon
//
//  Created by AV on 10/10/18.
//  Copyright © 2018 AV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@import Firebase;

@interface ViewController : UIViewController <WKNavigationDelegate>

@property (weak, nonatomic) UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *overlay;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

