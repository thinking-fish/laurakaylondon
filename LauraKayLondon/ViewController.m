//
//  ViewController.m
//  LauraKayLondon
//
//  Created by AV on 10/10/18.
//  Copyright © 2018 AV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.navigationDelegate = self;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.laurakaylondon.com/"]];
    [self.webView loadRequest:request];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isRegistered = [userDefaults boolForKey:@"registered"];
    if (isRegistered == NO) {
        FIRDatabaseReference *ref = [[[FIRDatabase database] reference] child:@"count"];
        [ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            int count = 0;
            if (snapshot.value) {
                count = [snapshot.value intValue];
            }
            count += 1;
            [ref setValue:[NSNumber numberWithInt:count]];
            [userDefaults setBool:YES forKey:@"registered"];
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


#pragma mark -
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [self.activityIndicator setHidden:NO];
}


-(void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [self.activityIndicator setHidden:YES];
    [self.overlay setHidden:YES];
}
@end
