//
//  ViewController.m
//  fukuri
//
//  Created by takuma on 2014/01/25.
//  Copyright (c) 2014年 卓馬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.kingaku setDelegate:self];
    [self.riritsuView setDelegate:self];
    [self.kikanView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)keisan:(id)sender {
    NSString *keisankekka = self.kingaku.text;
    
    self.kekka.text = keisankekka;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField{
        [theTextField resignFirstResponder];
    return YES;
}
@end
