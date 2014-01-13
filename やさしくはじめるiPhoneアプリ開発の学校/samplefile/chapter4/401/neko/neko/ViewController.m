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
                         @"cathappy01.png",
                         @"catsad01.png",
                         @"catsleep.png",
                         nil];
    int r = arc4random() % 4;
    [self.catImageView setImage:[UIImage imageNamed:[catImage objectAtIndex:r]]];
}
@end
