//
//  FollowMeViewController.h
//  FollowMe
//
//  Created by Ola Lundén on 3/30/11.
//  Copyright 2011 Fickla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowMeViewController : UIViewController {
    IBOutlet UILabel *level;
    IBOutlet UILabel *tries;
    NSTimer *timer;
    BOOL buttonHighlighted;
    BOOL sequenceRunning;
    NSMutableArray *sequenceOrder;
    int sequenceCounter;
    int numberOfTries;
    int gameLevel;
}

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic) BOOL buttonHighlighted;
@property (nonatomic) BOOL sequenceRunning;
@property (nonatomic, retain) NSArray *sequenceOrder;
@property (nonatomic) int sequenceCounter;
@property (nonatomic) int numberOfTries;
@property (nonatomic) int gameLevel;

- (void)setupGame;
- (void)startSequence;

- (void)highLightButton:(NSTimer *)theTimer;
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void)runSequence:(NSTimer *)theTimer;
- (void)makeRoundButtons;
- (NSMutableArray *)createArray:(int)withAmoutOfNumbers;

- (IBAction)buttonPressed:(UIButton *)sender;

@end
