//
//  MainViewController.m
//  SamplePushTestApp
//
//  Created by Nicolas Miyasato on 6/26/14.
//  Copyright (c) 2014 Kidozen. All rights reserved.
//

#import "MainViewController.h"
#import "KZApplication.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITextField *subscribeTextField;
@property (weak, nonatomic) IBOutlet UITextField *unsubscribeTextField;
@property (weak, nonatomic) IBOutlet UITextField *pushTextField;
@property (weak, nonatomic) IBOutlet UILabel *uuid;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;


@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Sample Push Test App";
}


- (IBAction)subscribe:(id)sender {
    [self.application.pushNotifications subscribeDeviceWithToken:[self.deviceToken description]
                                                       toChannel:self.subscribeTextField.text
                                                      completion:^(KZResponse *r) {
                                                          if (r.error == nil) {
                                                              NSLog(@"response is %@", r.response);
                                                              NSLog(@"Did Subscribe");
                                                          }
                                                      }];
}

- (IBAction)unsubscribe:(id)sender {
    [self.application.pushNotifications unSubscribeDeviceUsingToken:[self.deviceToken description]
                                                        fromChannel:self.unsubscribeTextField.text
                                                         completion:^(KZResponse *r) {
                                                             if (r.error == nil) {
                                                                 NSLog(@"response is %@", r.response);
                                                                 NSLog(@"Did Unsubsubscribe");
                                                             }
    }];
}

- (IBAction)push:(id)sender {
    [self.application.pushNotifications pushNotification:@{@"message": self.messageTextField.text}
                                               InChannel:self.pushTextField.text
                                              completion:^(KZResponse *r) {
                                                  if (r.error == nil) {
                                                      NSLog(@"response is %@", r.response);
                                                      NSLog(@"Did push");
                                                  }
        
    }];
}

@end
