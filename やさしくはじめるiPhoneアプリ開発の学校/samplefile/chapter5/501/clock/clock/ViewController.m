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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
