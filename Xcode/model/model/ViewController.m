//
//  ViewController.m
//  model
//
//  Created by Yu-ta TAMAKI on 2013/11/25.
//  Copyright (c) 2013年 Yu-ta TAMAKI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController


UIButton *OPbtn1;
UIButton *OPbtn2;
UIButton *OPbtn3;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ボタンを作成
    
    UIButton *button =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    OPbtn1 =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    OPbtn2 =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    OPbtn3 =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    

    
    //ボタンのサイズを画像と一緒にする
    button.frame = CGRectMake(40,100,250,250);
    
    // ボタンの位置を設定
    OPbtn1.center = CGPointMake(50, 75);
    OPbtn2.center = CGPointMake(150, 75);
    OPbtn3.center = CGPointMake(250, 75);
    
    
    // キャプションを設定
    
    [OPbtn1 setTitle:@"push"
            forState:UIControlStateNormal];
    [OPbtn2 setTitle:@"push"
            forState:UIControlStateNormal];
    [OPbtn3 setTitle:@"push"
            forState:UIControlStateNormal];
    
    
    // キャプションに合わせてサイズを設定
    [OPbtn1 sizeToFit];
    [OPbtn2 sizeToFit];
    [OPbtn3 sizeToFit];
    
    
    // 初期状態で オプションボタン非表示
    OPbtn1.hidden = YES;
    OPbtn2.hidden = YES;
    OPbtn3.hidden = YES;
    
    
    
    // ボタンがタップされたときに呼ばれるメソッドを設定
    [button addTarget:self
               action:@selector(incrementI:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button addTarget:self
               action:@selector(button_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn1 addTarget:self
               action:@selector(OPbtn1_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn2 addTarget:self
               action:@selector(OPbtn2_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn3 addTarget:self
               action:@selector(OPbtn3_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // ボタンをビューに追加
    [self.view addSubview:button];
    [self viewChange:(m)];
    
    
    [self.view addSubview:OPbtn1];
    [self.view addSubview:OPbtn2];
    [self.view addSubview:OPbtn3];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


/**
 * ボタンがタップされたとき
 */


- (void)button_Tapped:(id)sender
{
    // ここに処理を書く
    i++;
    counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    
    if (i % 10 == 0){
        OPbtn1.hidden = NO;
    }else {
        OPbtn1.hidden = YES;
    }
    if (i % 20 == 0){
        OPbtn2.hidden = NO;
    }else {
        OPbtn2.hidden = YES;
    }
    if (i % 30 == 0){
        OPbtn3.hidden = NO;
    }else {
        OPbtn3.hidden = YES;
    }
    

    // アラート
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"ED"
                          message:@"お疲れ様でしたーーー！！！"
                          delegate:self
                          cancelButtonTitle:@"キャンセル"
                          otherButtonTitles:@"戻る", nil];
    
    
    if (i==1000000){
        [alert show];
    }
    
}


/**
 * ボタン1がタップされたとき
 */
- (IBAction)OPbtn1_Tapped:(id)sender {
    //音の再生
    int sound = rand()%3;
    
    if (sound==0){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"おなら" ofType:@"mp3"];
        NSURL *url  = [NSURL fileURLWithPath:path];
    
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    else if (sound==1){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"炭酸飲料缶" ofType:@"mp3"];
        NSURL *url  = [NSURL fileURLWithPath:path];
        
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    else{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"残念" ofType:@"mp3"];
        NSURL *url  = [NSURL fileURLWithPath:path];
        
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    
    audio.volume = 0.5;
    audio.numberOfLoops = 1;
    
    [audio prepareToPlay];
    [audio play];
    
    //OPbtn1.hidden = YES;
    OPbtn2.hidden = YES;
    OPbtn3.hidden = YES;
}

/**
 * ボタン2がタップされたとき
 */
- (IBAction)OPbtn2_Tapped:(id)sender {

    int a = rand()%3;
    
    if (a==0){ //カウントを1000000にリセットする
        i = 0;
        counter.text = @"1000000";
    }
    else if (a==1){ //カウントを500000にする
        i = 500000;
        counter.text = @"500000";
    }
    else{ //カウントを100にする
        i = 999900;
        counter.text = @"100";
    }

    
    OPbtn1.hidden = YES;
    //OPbtn2.hidden = YES;
    OPbtn3.hidden = YES;
}


/**
 * ボタン3がタップされたとき
 */
- (IBAction)OPbtn3_Tapped:(id)sender {
    //カウントを+100する
    i = i - 100;
    counter.text = [NSString stringWithFormat:@"%d", 1000000 - i];

    OPbtn1.hidden = YES;
    OPbtn2.hidden = YES;
    OPbtn3.hidden = YES;

}






-(void) incrementI:(UIButton*)button{
    m++;
    [self viewChange:(m)];
}

-(void)viewChange:(int)ie
{
    CGRect rect = CGRectMake(40,100,250,250);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    
    NSArray *images = @[
                        [UIImage imageNamed:@"sweet1.jpg"],
                        [UIImage imageNamed:@"sweet2.jpg"],
                        [UIImage imageNamed:@"sweet3.jpg"],
                        [UIImage imageNamed:@"sweet4.jpeg"]
                        ];
    
    int ia = (1000000 - ie) % 250;
    if(ia == 0) {
        imageView.image = images[0];
    } else if(ia == 100){
        imageView.image = images[1];
    } else if(ia == 200){
        imageView.image = images[2];
    } else if(ia == 249){
        imageView.image = images[3];
    }
    
    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageView];
    
}

/**
 * カウントが0になったときのアラートの動作
 */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1: // 戻るが押されたとき
            NSLog(@"戻る");
            i = 0;
            counter.text = @"1000000";
            break;
            
        default: // キャンセルが押されたとき
            NSLog(@"キャンセル");
            i = 0;
            counter.text = @"1000000";
            break;

    }
    

}

@end