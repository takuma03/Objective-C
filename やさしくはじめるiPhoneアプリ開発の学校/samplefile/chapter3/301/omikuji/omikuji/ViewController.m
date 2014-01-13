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
    self.backBtn.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapStartBtn:(id)sender {
    self.otsugeView.hidden = NO;
    self.backBtn.hidden = NO;
}

- (IBAction)tapBackBtn:(id)sender {
    self.otsugeView.hidden = YES;
    self.backBtn.hidden = YES;
}
@end
