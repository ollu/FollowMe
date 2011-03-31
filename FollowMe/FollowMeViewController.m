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
@synthesize sequenceOrder;

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"%@", sender);
}

- (void)clickPattern {
//    for (int i = 1; i < 25; i++) {
//        UIButton *button = (UIButton *)[self.view viewWithTag:i];
//        [self highLightButton:button];
//    }
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
        self.buttonHighlighted = YES;
    }
}

- (void)runSequence:(NSTimer *)theTimer {
    if ([[theTimer userInfo] lastObject]) {
        int currentTag = [[[theTimer userInfo] lastObject] intValue];
        [sequenceOrder removeLastObject];

        timer = [NSTimer scheduledTimerWithTimeInterval:0.45 
                                                 target:self 
                                               selector:@selector(highLightButton:)
                                               userInfo:[NSNumber numberWithInteger:currentTag]
                                                repeats:YES];
    }
    else {
        [theTimer invalidate];
        theTimer = nil;
    }
}


- (NSMutableArray *)createArray:(int)withAmoutOfNumbers {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:withAmoutOfNumbers];
    
    // Create array with numbers from 1 to withAmoutOfNumbers
    for ( int i = 1; i < withAmoutOfNumbers+1; ++i ) {
        int randNumb = arc4random() % 24 +1;
        [mutableArray addObject:[NSNumber numberWithInt:randNumb]];
    }
    
    return mutableArray;    
}

- (void)dealloc {
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
    
    sequenceOrder = [self createArray:10];
    NSLog(@"SequensOrder created: %@", sequenceOrder);

    self.buttonHighlighted = NO;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 
                                             target:self 
                                           selector:@selector(runSequence:)
                                           userInfo:sequenceOrder
                                            repeats:YES];
    
    [super viewDidLoad];
}
 
@end