//
//  ViewController.h
//  fukuri
//
//  Created by takuma on 2014/01/25.
//  Copyright (c) 2014年 卓馬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *kingaku;
@property (weak, nonatomic) IBOutlet UITextField *riritsuView;
@property (weak, nonatomic) IBOutlet UITextField *kikanView;
@property (weak, nonatomic) IBOutlet UILabel *kekka;
- (IBAction)keisan:(id)sender;

@end
