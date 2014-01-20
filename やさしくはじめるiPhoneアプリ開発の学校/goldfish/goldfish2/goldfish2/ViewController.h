//
//  ViewController.h
//  goldfish2
//
//  Created by tkm03 on 2014/01/18.
//  Copyright (c) 2014年 tkm03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    //金魚が少しずつ進む移動量と角度
    float vx[10];
    float vy[10];
    float angles[10];
    //すくい上げたときにしばらくゲームを止めるカウンター
    int stopCounter;
    //ゲーム中かどうかを調べる変数
    BOOL gameFlag;
    //スコア
    int score;
    //残り回数
    int remaining;
    //金魚リスト
    NSArray *fishArray;
    //すくった金魚リスト
    NSMutableArray *getFish;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *poi;
@property (weak, nonatomic) IBOutlet UIImageView *fish1;
@property (weak, nonatomic) IBOutlet UIImageView *fish2;
@property (weak, nonatomic) IBOutlet UIImageView *fish3;
@property (weak, nonatomic) IBOutlet UIImageView *fish4;
@property (weak, nonatomic) IBOutlet UIImageView *fish5;
@property (weak, nonatomic) IBOutlet UIImageView *fish6;
@property (weak, nonatomic) IBOutlet UIImageView *fish7;
@property (weak, nonatomic) IBOutlet UIImageView *fish8;
@property (weak, nonatomic) IBOutlet UIImageView *fish9;
@property (weak, nonatomic) IBOutlet UIImageView *fish10;
@property (weak, nonatomic) IBOutlet UIImageView *poiCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *endingView;
@property (weak, nonatomic) IBOutlet UIButton *replayBtn;
@property (weak, nonatomic) IBOutlet UIImageView *titleView;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
- (IBAction)replayGame:(id)sender;
- (IBAction)startGame:(id)sender;

@end
