//
//  iMacMonitorAppDelegate.h
//  iMacMonitor
//
//  Created by Florian Bogner on 4/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <ApplicationServices/ApplicationServices.h>
#include <Carbon/Carbon.h>

@interface iMacMonitorAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	NSTimer *timer;
	bool macConnected;
	int delay;
}

@property (assign) IBOutlet NSWindow *window;

- (void)pressKeyWithModifiers:(CGKeyCode) key;
- (void)releaseKeyWithModifiers:(CGKeyCode) key;
- (int)checkForMacOverThunderbolt;
-(void)enableMonitorMode;
- (void)sleepComputer;

@end
