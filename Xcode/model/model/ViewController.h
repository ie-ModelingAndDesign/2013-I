//
//  ViewController.h
//  model
//
//  Created by Yu-ta TAMAKI on 2013/11/25.
//  Copyright (c) 2013年 Yu-ta TAMAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    int i;
    int m;
    __weak IBOutlet UILabel *counter;
    UIButton *btn;
}

- (void)viewChange:(int)i;
- (void)incrementI:(UIButton*)button;

@end