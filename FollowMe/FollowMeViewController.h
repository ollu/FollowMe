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
    int sequenceCounter;
    int numberOfTries;
}

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic) BOOL buttonHighlighted;
@property (nonatomic, retain) NSArray *sequenceOrder;
@property (nonatomic) int sequenceCounter;
@property (nonatomic) int numberOfTries;

- (void)setupGame;
- (void)runSequence;

- (void)highLightButton:(NSTimer *)theTimer;
- (void)runSequence:(NSTimer *)theTimer;
- (NSMutableArray *)createArray:(int)withAmoutOfNumbers;

- (IBAction)buttonPressed:(UIButton *)sender;

@end
