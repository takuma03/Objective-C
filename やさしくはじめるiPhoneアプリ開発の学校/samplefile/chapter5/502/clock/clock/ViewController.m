//
//  ViewController.m
//  clock
//
//  Created by 森 巧尚 on 2012/10/20.
//  Copyright (c) 2012年 myname. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [NSTimer
     scheduledTimerWithTimeInterval:0.1
     target:self
     selector:@selector(update)
     userInfo:nil
     repeats:YES];
}

- (void)update {
    NSDate *now = [NSDate date];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm:ss"];
    
    self.timeLabel.text = [df stringFromDate:now];
    
    [df setDateFormat:@"ss"];
    float s = [[df stringFromDate:now] intValue];
    [df setDateFormat:@"mm"];
    float m = [[df stringFromDate:now] intValue];
    [df setDateFormat:@"HH"];
    float h = [[df stringFromDate:now] intValue];
    
    self.hand1.transform = CGAffineTransformMakeRotation(M_PI * 2 * h / 12);
    self.hand2.transform = CGAffineTransformMakeRotation(M_PI * 2 * m / 60);
    self.hand3.transform = CGAffineTransformMakeRotation(M_PI * 2 * s / 60);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
