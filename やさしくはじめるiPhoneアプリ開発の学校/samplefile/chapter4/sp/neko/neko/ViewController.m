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
                         @"cat02.png",
                         @"catsad01.png",
                         @"catsad02.png",
                         @"catsad03.png",
                         @"catsad04.png",
                         @"catsmile.png",
                         @"catsleep.png",
                         nil];
    int r;
    do {
        r = arc4random() % 8;
    } while (r == face1);
    face1 = r;
    [self.catImageView setImage:[UIImage imageNamed:[catImage objectAtIndex:face1]]];
}

- (IBAction)headSwipe:(id)sender {
    NSArray *catImage = [NSArray arrayWithObjects:
                         @"catniko01.png",
                         @"catniko02.png",
                         nil];
    if (face2 == 0) {
        face2 = 1;
    } else {
        face2 = 0;
    }
    [self.catImageView setImage:[UIImage imageNamed:[catImage objectAtIndex:face2]]];
}

- (IBAction)chinSwipe:(id)sender {
    NSArray *catImage = [NSArray arrayWithObjects:
                         @"cathappy01.png",
                         @"cathappy02.png",
                         nil];
    if (face3 == 0) {
        face3 = 1;
    } else {
        face3 = 0;
    }
    [self.catImageView setImage:[UIImage imageNamed:[catImage objectAtIndex:face3]]];
}

- (IBAction)mouthPinch:(id)sender {
    [self.catImageView setImage:[UIImage imageNamed:@"cateee.png"]];
}

- (IBAction)birdTap:(id)sender {
    [self.catImageView setImage:[UIImage imageNamed:@"catjuru.png"]];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end
