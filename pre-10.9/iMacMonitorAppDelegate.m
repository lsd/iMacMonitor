//
//  iMacMonitorAppDelegate.m
//  iMacMonitor
//
//  Created by Florian Bogner on 4/16/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "iMacMonitorAppDelegate.h"


@implementation iMacMonitorAppDelegate

@synthesize window;

#define DELAY_INTERVAL 5

- (void)pressKeyWithModifiers:(CGKeyCode) key {
	CGEventSourceRef source = CGEventSourceCreate(kCGEventSourceStatePrivate);
	
	CGEventRef keyDown = CGEventCreateKeyboardEvent(source, key, TRUE);
	
	CGPostKeyboardEvent(0,key,TRUE);
	
	CFRelease(keyDown);
	CFRelease(source);  
}

- (void)releaseKeyWithModifiers:(CGKeyCode) key {
	CGEventSourceRef source = CGEventSourceCreate(kCGEventSourceStatePrivate);
			
	CGEventRef keyUp = CGEventCreateKeyboardEvent(source, key, FALSE);
			
	CGPostKeyboardEvent(0,key,FALSE);
			
	CFRelease(keyUp);
	CFRelease(source);  
}

-(void)enableMonitorMode {
	
	printf("Enabling monitor mode!\n");
	// press cmd
	[self pressKeyWithModifiers:kVK_Command];
	
	// press brightness up
	[self pressKeyWithModifiers:144];
	
	// release both keys
	[self releaseKeyWithModifiers:144];
	[self releaseKeyWithModifiers: kVK_Command];
}

- (int)checkForMacOverThunderbolt {
	
	const char* cmd="/usr/sbin/system_profiler SPThunderboltDataType|/usr/bin/grep 0xA27";
	
	return system(cmd);
	
}

- (void)sleepComputer {
	NSAppleScript *script = [[NSAppleScript alloc] initWithSource:@"tell application \"System Events\" to sleep"];
	NSDictionary *errorInfo;
	[script executeAndReturnError:&errorInfo];
	[script release];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timedCheck:) userInfo:nil repeats:YES];
	macConnected=false;
	delay=0;
}

-(void) dealloc {
	[timer invalidate];
	
	[super dealloc];
}

- (void)timedCheck: (NSNotification*)aNotification {
		
	if ([self checkForMacOverThunderbolt]==0) {
		
		delay=0;
		
		if (!macConnected) {
			macConnected=TRUE;
			[self enableMonitorMode];
		}
	}
	else {
		delay++;
		macConnected=FALSE;
		
		if (delay==DELAY_INTERVAL) {
			[self sleepComputer];
		}
		
		if (delay>DELAY_INTERVAL) {
			delay=DELAY_INTERVAL+1;
		}
	}
	
}
@end
