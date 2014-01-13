//
//  ViewController.m
//  omikuji
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
    self.otsugeView.hidden = YES;
    self.kuView.hidden = YES;
    self.backBtn.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapStartBtn:(id)sender {
    NSArray *otsuge = [NSArray arrayWithObjects:
                       @"kuji_1.jpg",
                       @"kuji_1.jpg",
                       @"kuji_2.jpg",
                       @"kuji_2.jpg",
                       @"kuji_3.jpg",
                       @"kuji_3.jpg",
                       @"kuji_4.jpg",
                       nil];
    NSArray *ku = [NSArray arrayWithObjects:
                   @"otsuge_1.png",
                   @"otsuge_2.png",
                   @"otsuge_3.png",
                   @"otsuge_4.png",
                   @"otsuge_5.png",
                   @"otsuge_6.png",
                   @"otsuge_7.png",
                   nil];
    int r = arc4random() % 7;
    [self.otsugeView setImage:[UIImage imageNamed:[otsuge objectAtIndex:r]]];
    [self.kuView setImage:[UIImage imageNamed:[ku objectAtIndex:r]]];
    
    self.startBtn.hidden = YES;
    self.otsugeView.hidden = NO;
    self.kuView.hidden = NO;
    self.backBtn.hidden = NO;
    
    self.otsugeView.alpha = 0.0;
    self.kuView.alpha = 0.0;
    self.backBtn.alpha = 0.0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    self.otsugeView.alpha = 1.0;
    self.kuView.alpha = 1.0;
    self.backBtn.alpha = 1.0;
    [UIView commitAnimations];
}

- (IBAction)tapBackBtn:(id)sender {
    self.startBtn.hidden = NO;
    self.otsugeView.hidden = YES;
    self.kuView.hidden = YES;
    self.backBtn.hidden = YES;
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
