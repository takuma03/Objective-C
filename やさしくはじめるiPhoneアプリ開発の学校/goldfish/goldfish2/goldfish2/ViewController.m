//
//  ViewController.m
//  goldfish2
//
//  Created by tkm03 on 2014/01/18.
//  Copyright (c) 2014年 tkm03. All rights reserved.
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //タッチした位置を調べる
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    //touchBeganで必要な処理
    [super touchesBegan:touches withEvent:event];
    
    //ポイをタップした位置に移動する（持っているように見せるため、少し左上に移動する）
    self.poi.center = CGPointMake(location.x -50,location.y -50);
    //ポイが水につかった絵に差し替える
    [self.poi setImage:[UIImage imageNamed:@"poi2.png"]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //タッチした位置を調べる
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    //touchesMoved処理で必要な処理
    [super touchesMoved:touches withEvent:event];
    
    //ポイをタップした位置に移動する（持っているように見せるため、少し左上に移動する）
    self.poi.center = CGPointMake(location.x - 50, location.y - 50);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //touchesEnded処理で必要な処理
    [super touchesEnded:touches withEvent:event];
    
    //ポイを通常の（水につかっていない）絵に戻す
    [self.poi setImage:[UIImage imageNamed:@"poi1.png"]];
}


@end
