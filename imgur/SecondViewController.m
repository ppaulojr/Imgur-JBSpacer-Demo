//
//  SecondViewController.m
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 13/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import "SecondViewController.h"

#define APP_VERSION [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"]
#define APP_EXECUTABLE  [[NSBundle mainBundle] infoDictionary][@"CFBundleExecutable"]
#define APP_NAME  [[NSBundle mainBundle] infoDictionary][@"CFBundleName"]
#define APP_BUILD_REVISION @"$Rev$"
#define APP_BUILD_DATE @"$Date$"
#define APP_LAST_AUTHOR @"$Author$"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
@property (weak, nonatomic) IBOutlet UILabel *buildTime;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *compiled = [NSString stringWithUTF8String:__DATE__];
    self.buildTime.text = [@"Build: " stringByAppendingString:compiled];
    self.versionLabel.text = [@"Version: " stringByAppendingString:APP_VERSION];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
