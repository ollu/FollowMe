//
//  FollowMeViewController.m
//  FollowMe
//
//  Created by Ola Lundén on 3/30/11.
//  Copyright 2011 Fickla. All rights reserved.
//

#import "FollowMeViewController.h"

@implementation FollowMeViewController

@synthesize timer;
@synthesize buttonHighlighted;
@synthesize sequenceRunning;
@synthesize sequenceOrder;
@synthesize sequenceCounter;
@synthesize numberOfTries;
@synthesize gameLevel;

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"%i", sequenceRunning);
    
    if (!sequenceRunning) {
        if ([sequenceOrder objectAtIndex:sequenceCounter] != [sequenceOrder lastObject]) {
            NSInteger currentSequenceNumber = [[sequenceOrder objectAtIndex:sequenceCounter] intValue];
            
            if (sender.tag == currentSequenceNumber) {
                sequenceCounter++;
            }
            else {
                [self startSequence];
                numberOfTries++;
            }
        }
        else {
            // Game Over, show stats and things here.
            NSString *windowTitle = @"Du klarade det!";
            NSString *gameResult = [NSString stringWithFormat:@"Du behövde %d försök \nför att klara mönstret.\nFörsök igen och \nförbättra ditt resultat.", numberOfTries];
            NSString *newGame = @"Givet!";
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:windowTitle
                                                            message:gameResult	
                                                           delegate:self 
                                                  cancelButtonTitle:nil 
                                                  otherButtonTitles:newGame, nil];
            [alert show];
            [alert autorelease];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        if (numberOfTries == 0) {
            gameLevel++;
        }
        [self setupGame];
    }
}

- (void)setupGame {
    numberOfTries   = 0;
    sequenceCounter = 0;

    sequenceOrder   = [self createArray:gameLevel];
    [sequenceOrder retain];

    [self startSequence];
    
    self.buttonHighlighted = NO;
    level.text = [NSString stringWithFormat:@"%i", gameLevel];
}

- (void)startSequence {
    sequenceRunning = YES;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 
                                             target:self 
                                           selector:@selector(runSequence:)
                                           userInfo:sequenceOrder
                                            repeats:YES];
    tries.text = [NSString stringWithFormat:@"%i", numberOfTries];
}

- (void)highLightButton:(NSTimer *)theTimer {
    // Since we're passing an NSNumber object we have to convert it to an int using the NSNumber method innValue
    int tagNum = [[theTimer userInfo] intValue];
    
    UIButton *button = (UIButton *)[self.view viewWithTag:tagNum];
    if (buttonHighlighted) {
        [[button layer] setCornerRadius:8.0f];
        [[button layer] setMasksToBounds:YES];
        [[button layer] setBorderWidth:0.0f];

        self.buttonHighlighted = NO;

        // Stop the timer
        [theTimer invalidate];
        theTimer = nil;
    } 
    else {
        [[button layer] setCornerRadius:8.0f];
        [[button layer] setMasksToBounds:YES];
        [[button layer] setBorderWidth:3.0f];
        [[button layer] setBorderColor:[[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1.0] CGColor]];
        self.buttonHighlighted = YES;
    }
}

- (void)runSequence:(NSTimer *)theTimer {
    if (sequenceCounter < [[theTimer userInfo] count]) {
        int currentTag = [[[theTimer userInfo] objectAtIndex:sequenceCounter] intValue];

        timer = [NSTimer scheduledTimerWithTimeInterval:0.45 
                                                 target:self 
                                               selector:@selector(highLightButton:)
                                               userInfo:[NSNumber numberWithInteger:currentTag]
                                                repeats:YES];
        sequenceCounter++;
    }
    else {
        [theTimer invalidate];
        theTimer = nil;
        sequenceCounter = 0;
        sequenceRunning = NO;
    }
}

- (void)makeRoundButtons {
    for (int i = 1; i < 25; i++) {
         UIButton *button = (UIButton *)[self.view viewWithTag:i];
        [[button layer] setCornerRadius:8.0f];
        [[button layer] setMasksToBounds:YES];
        [[button layer] setBorderWidth:0.0f];
    }
}

- (NSMutableArray *)createArray:(int)withAmoutOfNumbers {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:withAmoutOfNumbers];
    
    // Create array with numbers from 1 to withAmoutOfNumbers
    for ( int i = 1; i < withAmoutOfNumbers + 1; i++ ) {
        int randNumb = arc4random() % 24 + 1;
        [mutableArray addObject:[NSNumber numberWithInt:randNumb]];
    }
    
    return mutableArray;    
}

- (void)dealloc {
    [sequenceOrder release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [self makeRoundButtons];
    gameLevel = 3;
    [self setupGame];

    [super viewDidLoad];
}
 
@end