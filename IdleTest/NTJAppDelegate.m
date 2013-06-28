//
//  NTJAppDelegate.m
//  IdleTest
//
//  Created by Joshua May on 28/06/2013.
//  Copyright (c) 2013 nojo inc. All rights reserved.
//

#import "NTJAppDelegate.h"

@interface NTJAppDelegate ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, weak) IBOutlet NSTextField *timeTextField;

@end

@implementation NTJAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(handleTick:) userInfo:nil repeats:YES];
}

#pragma mark - Events

- (void)handleTick:(NSTimer *)timer
{
    CFTimeInterval time = CGEventSourceSecondsSinceLastEventType(kCGEventSourceStateCombinedSessionState, kCGAnyInputEventType);

    NSString *timeString = [NSString stringWithFormat:@"%0.1f", time];
    [self.timeTextField setStringValue:timeString];
}

@end
