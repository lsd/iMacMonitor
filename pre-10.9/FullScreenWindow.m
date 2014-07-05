//
//  FullScreenWindow.m
//  ECBrowser
//
//  Created by Florian Bogner on 1/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FullScreenWindow.h"


@implementation FullScreenWindow

//This Method access as wrapper to allow us to create a window larger than the screen => to hide the window border
- (NSRect)constrainFrameRect:(NSRect)frameRect toScreen:(NSScreen *)screen
{
	return frameRect;
}

//Init full screen
- (void)awakeFromNib {
	
	//Enable detection for NSApplicationPresentationOptions
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setKioskMode) name:@"NSWindowDidUpdateNotification" object:nil];
	
	//Make bg black
	[self setBackgroundColor:[NSColor blackColor]];
	
	//Get fullscreen
	NSRect screensize=[[NSScreen mainScreen] frame];	//get screen size
	screensize.size.height+=23;	//add menu bar height
	[self setFrame:screensize display:YES animate:YES];	//make fullscreen
	
	//disable resize, move,...
	[self setStyleMask:NSBorderlessWindowMask];
	
	//center the cursor
	NSPoint center;
	center.x=floor([[NSScreen mainScreen] frame].size.width/2);
	center.y=floor([[NSScreen mainScreen] frame].size.height/2);
	CGWarpMouseCursorPosition(NSPointToCGPoint(center));
	
}

- (BOOL) canBecomeKeyWindow	{ //be the key window even if you are borderless
	return YES;
}

-(void)dealloc { //Cleaning up
	[[NSNotificationCenter defaultCenter] removeObserver:self];	//stop listening
	
	[NSCursor unhide];
	
	[super dealloc];
}


-(void)setKioskMode {	//hide menu bar, dock, . . . 
	NSApplicationPresentationOptions options = NSApplicationPresentationHideDock + NSApplicationPresentationHideMenuBar;// + NSApplicationPresentationDisableProcessSwitching; //+ NSApplicationPresentationDisableForceQuit;
	[NSApp setPresentationOptions:options];
	
	//hide the cursor
	[NSCursor hide];
}

@end
