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
    
    FBLoginView *fbLoginView = [[FBLoginView alloc] init];
    fbLoginView.frame = CGRectOffset(fbLoginView.frame, (self.view.center.x - (fbLoginView.frame.size.width / 2)), 5);
    [self.view addSubview:fbLoginView];
    
    fbLoginView.readPermissions = @[@"basic_info", @"email", @"user_likes"];
    fbLoginView.delegate = self;
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

#pragma mark - Facebook

// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    
    // set user class data for reference
    /*
    UserClass *obj=[UserClass getInstance];
    obj.email= [user objectForKey:@"email"];
    obj.first_name= user.first_name;
     */
    
    NSLog(@"HELLO");
    
    
}



// User Logged in to facebook
- (void)fbDidLogin {
    NSLog(@"logged in");
}


// Logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    //self.statusLabel.text = @"You're logged in as";
    
    NSLog(@"LOGGED IN");
    
    
    if (FBSession.activeSession.isOpen) {
        [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection,id<FBGraphUser> user,NSError *error) {
            if (!error) {
                
                /*
                
                UserClass *obj=[UserClass getInstance];
                
                //obj.token = user.id;
                obj.email = (NSString *)[user objectForKey:@"email"];
                
                NSString *imageUrl = @"http://graph.facebook.com/";
                imageUrl = [imageUrl stringByAppendingString:user.id];
                imageUrl = [imageUrl stringByAppendingString:@"/picture?width=500&height=500"];
                
                NSDate *date = [[[FBSession activeSession] accessTokenData] expirationDate] ;
                double dateDouble = [date timeIntervalSince1970] * 1000;
                
                NSLog(@" DATE: %@", [NSString stringWithFormat:@"%f", dateDouble]);
                
                
                NSLog(@"Time: %f", dateDouble);
                NSLog(@"Time: %f", floor([date timeIntervalSince1970] * 1000));
                
                NSString *bodyData = @"?app_token=d2958fd48f766b4abdbe9973BKfMkb64fbadada2df6add&uid=";
                bodyData = [bodyData stringByAppendingString:user.id];
                bodyData = [bodyData stringByAppendingString:@"&oauth_token="];
                bodyData = [bodyData stringByAppendingString:(NSString *)[[[FBSession activeSession] accessTokenData] accessToken]];
                bodyData = [bodyData stringByAppendingString:@"&oauth_expires_at="];
                bodyData = [bodyData stringByAppendingString:@"1396050567073.091064"];//[NSString stringWithFormat:@"%f", dateDouble]];
                bodyData = [bodyData stringByAppendingString:@"&email="];
                bodyData = [bodyData stringByAppendingString:[user objectForKey:@"email"]];
                bodyData = [bodyData stringByAppendingString:@"&first_name="];
                bodyData = [bodyData stringByAppendingString:user.first_name];
                bodyData = [bodyData stringByAppendingString:@"&last_name="];
                bodyData = [bodyData stringByAppendingString:user.last_name];
                bodyData = [bodyData stringByAppendingString:@"&image_url="];
                bodyData = [bodyData stringByAppendingString:imageUrl];
                
                
                NSString *urlString = [APIHost stringByAppendingString:@"/api/mobile/v1/users/facebook_login"];
                urlString = [urlString stringByAppendingString:bodyData];
                //NSString *urlString = [@"http://localhost:3000/api/mobile/v1/users/facebook_login" stringByAppendingString:bodyData];
                //NSString *urlString = [@"http://bioniq-staging.herokuapp.com/api/mobile/v1/users/facebook_login" stringByAppendingString:bodyData];
                
                NSLog(@"bodyData: %@", bodyData);
                
                
                NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
                
                // Set the request's content type to application/x-www-form-urlencoded
                [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                
                
                [postRequest setHTTPMethod:@"POST"];
                //[postRequest setHTTPBody:[NSData dataWithBytes:[bodyData UTF8String] length:strlen([bodyData UTF8String])]];
                
                [postRequest setHTTPBody:[bodyData dataUsingEncoding:NSUTF8StringEncoding]];
                
                
                NSURLConnection *connection = [NSURLConnection connectionWithRequest:postRequest delegate:self];
                [connection start];//It will start delegates
                
                 */
                
            }
        }];
    }
    
    
    
    
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // add logged out experience here
}

// Handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}


@end
