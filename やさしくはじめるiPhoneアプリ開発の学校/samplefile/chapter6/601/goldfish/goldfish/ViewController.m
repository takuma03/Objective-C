//
//  ViewController.m
//  goldfish
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

- (BOOL)shouldAutorotate {
    return NO;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //-- タッチした位置を調べる
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self.view];
    //-- touchesBeganで必要な処理
	[super touchesBegan:touches withEvent:event];
	
    //-- ポイをタップした場所（の少し左上）に移動する
    self.poi.center = CGPointMake(location.x - 50, location.y - 50);
    //-- ポイを水につかった絵に差し替える
    [self.poi setImage:[UIImage imageNamed:@"poi2.png"]];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //-- タッチした位置を調べる
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self.view];
    //-- touchesMoved処理で必要な処理
	[super touchesMoved:touches withEvent:event];
	
    //-- ポイをタップした場所（の少し左上）に移動する
    self.poi.center = CGPointMake(location.x - 50, location.y - 50);
	
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //-- touchesEnded処理で必要な処理
	[super touchesEnded:touches withEvent:event];
    
    //-- ポイを通常の（水につかっていない）絵に戻す
    [self.poi setImage:[UIImage imageNamed:@"poi1.png"]];
    
}
@end
