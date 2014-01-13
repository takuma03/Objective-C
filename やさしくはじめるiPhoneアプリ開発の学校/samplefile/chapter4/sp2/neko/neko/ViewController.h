//
//  ViewController.h
//  neko
//
//  Created by 森 巧尚 on 2012/10/20.
//  Copyright (c) 2012年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    int face1;
    int face2;
    int face3;
}
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;
- (IBAction)doubleTap:(id)sender;
- (IBAction)headSwipe:(id)sender;
- (IBAction)chinSwipe:(id)sender;
- (IBAction)mouthPinch:(id)sender;
- (IBAction)birdTap:(id)sender;

@end
