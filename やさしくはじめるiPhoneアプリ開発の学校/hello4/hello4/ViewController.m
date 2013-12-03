//
//  ViewController.m
//  hello4
//
//  Created by tkm03 on 2013/12/03.
//  Copyright (c) 2013年 tkm03. All rights reserved.
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

- (IBAction)tapBtn:(id)sender {
    NSArray *hello =@[@"おはよう",@"こんにちは",@"こんばんは",@"おやすみ",@"さようなら",@"ありがとう",@"ごめんなさい",@"おつかれさま",@"いってきます",@"ただいま",@"いってきます",@"ただいま",@"いってらっしゃい",@"おかえり",@"ひさしぶり",@"またね",@"おめでとう"];
    
    int r = arc4random() % 15;
    self.myLabel.text = [hello objectAtIndex:r];
}
@end
