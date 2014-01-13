//
//  ViewController.m
//  neko
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doubleTap:(id)sender {
    NSArray *catImage = [NSArray arrayWithObjects:
                         @"cat01.png",
                         @"catsad01.png",
                         @"catsad02.png",
                         @"catsleep.png",
                         nil];
    int r = arc4random() % 4;
    [self.catImageView setImage:[UIImage imageNamed:[catImage objectAtIndex:r]]];
}

- (IBAction)headSwipe:(id)sender {
    NSArray *catImage = [NSArray arrayWithObjects:
                         @"catniko01.png",
                         @"catniko02.png",
                         nil];
    int r = arc4random() % 2;
    [self.catImageView setImage:[UIImage imageNamed:[catImage objectAtIndex:r]]];
}

- (IBAction)chinSwipe:(id)sender {
    NSArray *catImage = [NSArray arrayWithObjects:
                         @"cathappy01.png",
                         @"cathappy02.png",
                         nil];
    int r = arc4random() % 2;
    [self.catImageView setImage:[UIImage imageNamed:[catImage objectAtIndex:r]]];
}

- (IBAction)mouthPinch:(id)sender {
    [self.catImageView setImage:[UIImage imageNamed:@"cateee.png"]];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
