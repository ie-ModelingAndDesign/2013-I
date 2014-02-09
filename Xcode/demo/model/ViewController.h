//
//  ViewController.h
//  model
//
//  Created by Yu-ta TAMAKI on 2013/11/25.
//  Copyright (c) 2013年 Yu-ta TAMAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#include <AudioToolbox/AudioToolbox.h> 

@interface ViewController : UIViewController {
    int i;
 //   int m;
    __weak IBOutlet UILabel *counter;
@public AVAudioPlayer *audio; //音のメンバ変数
    
    
    
    //効果音のID
    CFURLRef soundURL;
    SystemSoundID soundID;
    
}

@property(readwrite) CFURLRef soundURL;
@property(readonly) SystemSoundID soundID;

- (void)viewChange:(int)i;
//- (void)incrementI:(UIButton*)button;
- (void)OptionCounter:()value;
- (void)CounterJudged:()value;

@end