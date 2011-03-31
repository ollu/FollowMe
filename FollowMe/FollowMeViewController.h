//
//  FollowMeViewController.h
//  FollowMe
//
//  Created by Ola Lundén on 3/30/11.
//  Copyright 2011 Fickla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowMeViewController : UIViewController {
    NSTimer *timer;
    BOOL buttonHighlighted;
    NSMutableArray *sequenceOrder;
}

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic) BOOL buttonHighlighted;
@property (nonatomic, retain) NSArray *sequenceOrder;

- (void)clickPattern;

- (void)highLightButton:(NSTimer *)theTimer;
- (void)runSequence:(NSTimer *)theTimer;
- (NSMutableArray *)createArray:(int)withAmoutOfNumbers;

- (IBAction)buttonPressed:(UIButton *)sender;

@end
