//
//  FollowMeAppDelegate.h
//  FollowMe
//
//  Created by Ola Lundén on 3/30/11.
//  Copyright 2011 Fickla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FollowMeViewController;

@interface FollowMeAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FollowMeViewController *viewController;

@end
