//
//  ViewController.h
//  goldfish
//
//  Created by 森 巧尚 on 2012/10/20.
//  Copyright (c) 2012年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    // 金魚が少しずつ進む移動量と角度
    float vx[10];
    float vy[10];
    float angles[10];
    // すくい上げたときにしばらくゲームを止めるカウンター
    int stopCounter;
    // ゲーム中かどうかを調べる変数

    // 金魚リスト
    NSArray *fishArray;
    // すくった金魚リスト
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

@end
