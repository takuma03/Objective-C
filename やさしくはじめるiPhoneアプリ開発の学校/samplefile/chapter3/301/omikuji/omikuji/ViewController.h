//
//  ViewController.h
//  omikuji
//
//  Created by 森 巧尚 on 2012/10/20.
//  Copyright (c) 2012年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)tapStartBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *otsugeView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
- (IBAction)tapBackBtn:(id)sender;

@end
