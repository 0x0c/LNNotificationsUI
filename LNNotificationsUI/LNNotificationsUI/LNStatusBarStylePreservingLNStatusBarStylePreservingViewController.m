//
//  LNStatusBarStylePreservingViewController.m
//  LNNotificationsUI
//
//  Created by Akira Matsuda on 6/2/16.
//  Copyright © 2016 Leo Natan. All rights reserved.
//

#import "LNStatusBarStylePreservingViewController.h"
#import "LNNotificationBannerWindow.h"

@interface _LNWindowSizedView : UIView @end
@implementation _LNWindowSizedView

- (void)didMoveToWindow
{
	if(self.window == nil)
	{
		return;
	}
	
	self.translatesAutoresizingMaskIntoConstraints = NO;
	
	BOOL oldVal = [(LNNotificationBannerWindow*)self.window ignoresAddedConstraints];
	[(LNNotificationBannerWindow*)self.window setIgnoresAddedConstraints:NO];
	
	[self.window addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self}]];
	[self.window addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": self}]];
	
	[(LNNotificationBannerWindow*)self.window setIgnoresAddedConstraints:oldVal];
}

@end

@implementation LNStatusBarStylePreservingViewController

- (void)loadView
{
	self.view = [_LNWindowSizedView new];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return [[UIApplication sharedApplication] statusBarStyle];
}

- (BOOL)prefersStatusBarHidden
{
	return [[UIApplication sharedApplication] isStatusBarHidden];
}

@end
