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
    fishArray = [NSArray arrayWithObjects:self.fish1,self.fish2,self.fish3,self.fish4,self.fish5,self.fish6,self.fish7,self.fish8,self.fish9,self.fish10,nil];
    [self dispTitle];
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
    
    if(gameFlag == NO) {
        //ゲーム中でないなら、なにもしない
        return;
    }
    
    if(0 < stopCounter){
        //すくいあげているときは、なにもしない
        return;
    }
    
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

    if(gameFlag == NO) {
        //ゲーム中でないなら、なにもしない
        return;
    }
    
    if(0 < stopCounter){
        //すくいあげてるときは、なにもしない
        return;
    }
    
    //ポイをタップした位置に移動する（持っているように見せるため、少し左上に移動する）
    self.poi.center = CGPointMake(location.x - 50, location.y - 50);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    //touchesEnded処理で必要な処理
    [super touchesEnded:touches withEvent:event];
    
    if(gameFlag == NO) {
        //ゲーム中でないなら、なにもしない
        return;
    }
    
    if (0 < stopCounter) {
        //すくいあげているときは、なにもしない
        return;
    }
    
    //すべての金魚を調べる
    getFish = [NSMutableArray array];
    for(int i = 0; i < fishArray.count; i++){
        UIImageView *w_fish = [fishArray objectAtIndex:i];
        
        //金魚とポイの距離を調べて
        float dx = abs(w_fish.center.x - self.poi.center.x);
        float dy = abs(w_fish.center.y - self.poi.center.y);
        float dist = sqrtf(dx * dx + dy * dy);
        
        //金魚とポイの距離が40以下なら
        if (dist < 40) {
            //すくいあげたリストに入れる
            [getFish addObject:w_fish];
            //金魚をはっきり大きく表示
            w_fish.alpha = 1.0;
            CGAffineTransform tf = w_fish.transform;
            w_fish.transform = CGAffineTransformScale(tf, 2, 2);
            //スコアを追加する
            score++;
            self.scoreLabel.text = [NSString stringWithFormat:@"%d匹",score];
        }
    }
    
    //ポイを通常の（水につかっていない）絵に戻す
    [self.poi setImage:[UIImage imageNamed:@"poi1.png"]];
    self.poi.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
    //すくいあげたので、カウンター30回分停止させる
    stopCounter = 30;
}

- (void)initGame{
    stopCounter = 0;
    //金魚を全て初期化する
    for(int i = 0; i < fishArray.count; i++){
        UIImageView *w_fish = [fishArray objectAtIndex:i];
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
    if(gameFlag == NO) {
        //ゲーム中でないなら、なにもしない
        return;
    }
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
            
            //残り回数を減らして表示
            remaining--;
            [self.poiCount setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prest%d.png",remaining]]];
            if (remaining == 0) {
                //残りが0なら、ゲームを止めてゲームオーバーとリプレイボタンを表示
                gameFlag = NO;
                self.replayBtn.hidden = NO;
                self.endingView.hidden = NO;
            }
        }
    }
}

//タイトル画面を表示
- (void)dispTitle{
    //ゲームは停止
    gameFlag = NO;
    //タイトル画面を表示
    self.startBtn.hidden = NO;
    self.titleView .hidden = NO;
    //リプレイ画面は非表示
    self.endingView.hidden = YES;
    self.replayBtn.hidden = YES;
}

//ゲームを始める
-(void)startGame{
    [self initGame];
    //タイトル画面を非表示
    self.startBtn.hidden = YES;
    self.titleView.hidden = YES;
    //ゲームの初期化
    score = 0;
    remaining = 5;
    self.scoreLabel.text = [NSString stringWithFormat:@"0匹"];
    [self.poiCount setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prest%d.png",remaining]]];
    self.poi.center = CGPointMake(225,385);
    gameFlag = YES;
}





- (IBAction)replayGame:(id)sender {
    [self dispTitle];
}

- (IBAction)startGame:(id)sender {
    [self startGame];
}
@end
