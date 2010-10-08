//
//  StompfoneAppDelegate.m
//  Stompfone
//
//  Created by Jean-Frederic Mesnil on 08/10/10.
//  Copyright 2010 http://jmesnil.net/. All rights reserved.
//

#import "StompfoneAppDelegate.h"
#import "CRVStompClient.h"

#define kDestination @"jms.queue.ExampleQueue"

@implementation StompfoneAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    if (stompClient) {
        [stompClient unsubscribeFromDestination:kDestination];
        [stompClient disconnect];
    }
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [stompClient release];
    [window release];
    [super dealloc];
}


- (IBAction)send:(id)sender {
    if (!stompClient) {
        stompClient = [[[CRVStompClient alloc]
                             initWithHost:@"localhost" 
                             port:61613 
                             login:@"guest"
                             passcode:@"guest"
                             delegate:self] retain];
        [stompClient connect];
        [stompClient subscribeToDestination:kDestination];
    }
    [stompClient sendMessage:sendText.text toDestination:kDestination];
    NSLog(@"sending %@ to %@", sendText.text, stompClient);
}

- (void)stompClientDidConnect:(CRVStompClient *)stompService {
    NSLog(@"stompServiceDidConnect");
}

- (void)serverDidSendError:(CRVStompClient *)stompService withErrorMessage:(NSString *)description detailedErrorMessage:(NSString *) theMessage {
    NSLog(@"serverDidSendError");    
}


- (void)stompClient:(CRVStompClient *)stompService messageReceived:(NSString *)body withHeader:(NSDictionary *)messageHeader {
    receivedText.text = body;
}

@end
