//
//  StompfoneAppDelegate.h
//  Stompfone
//
//  Created by Jean-Frederic Mesnil on 08/10/10.
//  Copyright 2010 http://jmesnil.net/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRVStompClient.h"

@interface StompfoneAppDelegate : NSObject <UIApplicationDelegate, CRVStompClientDelegate> {
    UIWindow *window;
    IBOutlet UITextField *sendText;
    IBOutlet UILabel *receivedText;
    
    CRVStompClient *stompClient;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)send:(id)sender;

@end

