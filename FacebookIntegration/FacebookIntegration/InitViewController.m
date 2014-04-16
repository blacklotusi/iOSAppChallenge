//
//  InitViewController.m
//  FacebookIntegration
//
//  Created by Nicole Phelps on 4/9/14.
//  Copyright (c) 2014 Nicole Phelps. All rights reserved.
//

#import "InitViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface InitViewController ()

@end

@implementation InitViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FBLoginView *loginView = [[FBLoginView alloc] init];
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
    [self.view addSubview:loginView];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
