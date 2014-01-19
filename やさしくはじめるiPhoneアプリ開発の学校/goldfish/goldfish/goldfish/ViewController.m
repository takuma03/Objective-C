//
//  ViewController.m
//  goldfish
//
//  Created by 卓馬 on 2014/01/13.
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
    
    fishArray = [NSArray arrayWithObjects:self.fish1,self.fish2,self.fish3,self.fish4,self.fish5,self.fish6,self.fish7,self.fish8,self.fish9,self.fish10];
    [self initGame];
    //0.05秒ごとにmainloopを繰り返し実行する
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(mainloop) userInfo:nil repeats:YES];
    
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

- (void)initGame{
    stopCounter = 0;
    //金魚を全て初期化する
    for(int i = 0; i < fishArray.count; i++){
        UIImage *w_fish = [fishArray objectAtIndex:i];
        //各金魚の番号をtag変数に入れておいて、その金魚を初期化
        w_fish.tag = i;
        [self initFish:w_fish];
    }
}

//金魚の初期化
- (void)initFish:(UIImageView *) w_fish{
    //金魚の番号を調べる
    int wid = w_fish.tag;
    
    //金魚の位置をランダムに決定する
    int x = arc4random() % 280 + 20;
    int y = arc4random() % 480 + 40;
    w_fish.center = CGPointMake(x, y);
    
    //金魚の向き、スピードをランダムに決定して、番号を使って保存しておく
    float spd = arc4random() % 12 + 1;
    float angle = arc4random() % 360;
    float rad = angle * M_PI / 180.0;
    vx[wid] = cos(rad) * spd;
    vy[wid] = sin(rad) * spd;
    angles[wid] = angle;
    w_fish.transform = CGAffineTransformMakeRotation(angle * M_PI / 180.0);
    
    //水中にいるときは薄く表示
    w_fish.alpha = 0.5;
}

//ゲーム中に繰り返し行う処理
- (void)mainloop{
    if(stopCounter == 0){
        for(int i = 0; i < fishArray.count; i++){
            UIImageView *w_fish = [fishArray objectAtIndex:i];
            //番号から移動スピードを調べて（vx,vy）、少し移動させた位置を求める
            float wx =  w_fish.center.x + vx[w_fish.tag];
            float wy =  w_fish.center.y + vy[w_fish.tag];
            
            //位置が水槽からはみ出していたら反対側に移動する
            if(340 < wx){
                wx = -10;
            }
            if(wx < -20){
                wx = 330;
            }
            if(500 < wy){
                wy = -10;
            }
            if(wy < -20){
                wy = 490;
            }
            //金魚を指定した位置に移動させる
            w_fish.center = CGPointMake(wx, wy);
        }
    }else if(0< stopCounter){
        //すくい上げたときはゲームを一時停止して、カウントダウン
        stopCounter--;
        if(stopCounter == 0){
            //カウントが0になったら、
            //すくいあげたリストの金魚を元の大きさにして別のところに再登場させる
            for(int i = 0; i < getFish.count; i++){
                UIImageView *w_fish = [getFish objectAtIndex:i];
                w_fish.transform = CGAffineTransformIdentity;
                [self initFish:w_fish];
            }
            //ポイをもとの大きさに戻す
            self.poi.transform = CGAffineTransformIdentity;
        }
    }
}





@end
