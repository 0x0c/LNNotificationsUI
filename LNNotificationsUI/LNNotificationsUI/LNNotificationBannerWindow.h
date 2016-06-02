//
//  LNNotificationBannerWindow.h
//  LNNotificationsUI
//
//  Created by Leo Natan on 9/5/14.
//  Copyright (c) 2014 Leo Natan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNNotification.h"
#import "LNNotificationCenter.h"
#import "LNStatusBarStylePreservingViewController.h"

@interface LNNotificationBannerWindow : UIWindow

@property (nonatomic, readonly) BOOL isNotificationViewShown;
@property (nonatomic) BOOL ignoresAddedConstraints;

- (instancetype)initWithFrame:(CGRect)frame style:(LNNotificationBannerStyle)bannerStyle;

- (void)presentNotification:(LNNotification*)notification completionBlock:(void(^)())completionBlock;
- (void)dismissNotificationViewWithCompletionBlock:(void(^)())completionBlock;

@end
