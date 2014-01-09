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
UIButton *OPbtn4;
UIButton *OPbtn5;
UIButton *OPbtn6;
int k = 10000;      // 100万のうちに、何回オプションボタンを出現させるか (とりあえず1万回)
                    // OptionFrequencyの数字も変更する必要あり
int oprum = 11;     // 作業用変数
int hairetsu[10000];

@synthesize soundURL;
@synthesize soundID;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // オプションボタンの出現位置をランダムで決定
    for (int c=0; c<k ;c++){
        hairetsu[c] = arc4random_uniform(1000000);
    }
    
    
    // ボタンを作成
    
    UIButton *button =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    OPbtn1 =
    [UIButton buttonWithType:UIButtonTypeCustom];
    OPbtn2 =
    [UIButton buttonWithType:UIButtonTypeCustom];
    OPbtn3 =
    [UIButton buttonWithType:UIButtonTypeCustom];
    OPbtn4 =
    [UIButton buttonWithType:UIButtonTypeCustom];
    OPbtn5 =
    [UIButton buttonWithType:UIButtonTypeCustom];
    OPbtn6 =
    [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    // オプションボタンの画像
    [OPbtn1 setImage:[UIImage imageNamed:@"button.png"]
            forState:UIControlStateNormal];
    [OPbtn2 setImage:[UIImage imageNamed:@"button.png"]
            forState:UIControlStateNormal];
    [OPbtn3 setImage:[UIImage imageNamed:@"button.png"]
            forState:UIControlStateNormal];
    [OPbtn4 setImage:[UIImage imageNamed:@"button.png"]
            forState:UIControlStateNormal];
    [OPbtn5 setImage:[UIImage imageNamed:@"button.png"]
            forState:UIControlStateNormal];
    [OPbtn6 setImage:[UIImage imageNamed:@"button.png"]
            forState:UIControlStateNormal];
    
    
    //ボタンのサイズを画像と一緒にする
    button.frame = CGRectMake(0,145,320,250);
    
    // ボタンの位置とサイズを設定
    [OPbtn1 setFrame:CGRectMake( 20, 100, 40, 40)];
    [OPbtn2 setFrame:CGRectMake(140, 100, 40, 40)];
    [OPbtn3 setFrame:CGRectMake(260, 100, 40, 40)];
    [OPbtn4 setFrame:CGRectMake( 20, 400, 40, 40)];
    [OPbtn5 setFrame:CGRectMake(140, 400, 40, 40)];
    [OPbtn6 setFrame:CGRectMake(260, 400, 40, 40)];

    

    
/*
    // キャプションを設定
    
    [OPbtn1 setTitle:@"push"
            //forState:UIControlStateNormal];
    [OPbtn2 setTitle:@"push"
            forState:UIControlStateNormal];
    [OPbtn3 setTitle:@"push"
            forState:UIControlStateNormal];
    [OPbtn4 setTitle:@"push"
            forState:UIControlStateNormal];
    [OPbtn5 setTitle:@"push"
            forState:UIControlStateNormal];
    [OPbtn6 setTitle:@"push"
            forState:UIControlStateNormal];

    
    // キャプションに合わせてサイズを設定
    [OPbtn1 sizeToFit];
    [OPbtn2 sizeToFit];
    [OPbtn3 sizeToFit];
    [OPbtn4 sizeToFit];
    [OPbtn5 sizeToFit];
    [OPbtn6 sizeToFit];
*/
    
    
    // 初期状態で オプションボタン非表示
    OPbtn1.hidden = YES;
    OPbtn2.hidden = YES;
    OPbtn3.hidden = YES;
    OPbtn4.hidden = YES;
    OPbtn5.hidden = YES;
    OPbtn6.hidden = YES;
    
    
    
    // ボタンがタップされたときに呼ばれるメソッドを設定
    /*[button addTarget:self
               action:@selector(incrementI:)
     forControlEvents:UIControlEventTouchUpInside];*/
    
    [button addTarget:self
               action:@selector(button_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn1 addTarget:self
               action:@selector(OptionBtn_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn2 addTarget:self
               action:@selector(OptionBtn_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn3 addTarget:self
               action:@selector(OptionBtn_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn4 addTarget:self
               action:@selector(OptionBtn_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn5 addTarget:self
               action:@selector(OptionBtn_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [OPbtn6 addTarget:self
               action:@selector(OptionBtn_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // ボタンをビューに追加
    [self.view addSubview:button];
    [self viewChange:(i)];
    
    
    [self.view addSubview:OPbtn1];
    [self.view addSubview:OPbtn2];
    [self.view addSubview:OPbtn3];
    [self.view addSubview:OPbtn4];
    [self.view addSubview:OPbtn5];
    [self.view addSubview:OPbtn6];
    
    CFBundleRef mainBundle;
    mainBundle = CFBundleGetMainBundle ();
    
    soundURL  = CFBundleCopyResourceURL (mainBundle,CFSTR ("001"),CFSTR ("mp3"),NULL);
    AudioServicesCreateSystemSoundID (soundURL, &soundID);
    CFRelease (soundURL);

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
    [self viewChange:(i)];
    [self Effective_sound];
    [self OptionFrequency:0];
    
    // ここに処理を書く
    i++;
    counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    
    if (oprum == 0){
        OPbtn1.hidden = NO;
        oprum = 11;
    }else {
        OPbtn1.hidden = YES;
    }
    if (oprum % 2 == 0){
        OPbtn2.hidden = NO;
        oprum = 11;
    }else {
        OPbtn2.hidden = YES;
    }
    if (oprum == 1){
        OPbtn3.hidden = NO;
        oprum = 11;
    }else {
        OPbtn3.hidden = YES;
    }
    if (oprum % 3 == 0){
        OPbtn4.hidden = NO;
        oprum = 11;
    }else {
        OPbtn4.hidden = YES;
    }
    if (oprum == 5){
        OPbtn5.hidden = NO;
        oprum = 11;
    }else {
        OPbtn5.hidden = YES;
    }
    if (oprum == 6){
        OPbtn6.hidden = NO;
        oprum = 11;
    }else {
        OPbtn6.hidden = YES;
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
 * オプションボタンの関数細分化
 */

- (IBAction)OptionBtn_Tapped:(id)sender {

    
    [self OptionCounter:0];
    [self OptionSound];
    [self viewChange:(i)];
    OPbtn1.hidden = YES;
    OPbtn2.hidden = YES;
    OPbtn3.hidden = YES;
    OPbtn4.hidden = YES;
    OPbtn5.hidden = YES;
    OPbtn6.hidden = YES;
}


- (void)OptionCounter:(id)sender {
    
    srand(time(NULL));  //被らない数値を渡して初期化
    int a = rand()%100;
    
    if (a<6){                              //カウントを1000000に(リセット)する
        i = 0;
        counter.text = @"1000000";
    }else if (6<a && a<9){                 //カウントを500000にする
        i = 500000;
        counter.text = @"500000";
    }else if (a == 10){                    //カウントを100にする
        i = 999900;
        counter.text = @"100";
    }else if (10<a && a<25){               //カウントを+1000する
        i = i - 1000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    }else if (25<a && a<40){               //カウントを-1000する
        i = i + 1000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    }else if (40<a && a<45){               //カウントを+100000する
        i = i - 100000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    }else if (45<a && a<50){               //カウントを-100000する
        i = i + 100000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    }
    
    [self CounterJudged:0];
}




/**
 * カウンターの上限値(100万)、下限値(0)を設定
 */
- (void)CounterJudged:(id)sender {
    if (1000000 - i > 1000000){
        i = 0;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    }else if (1000000 - i < 0){
        i = 999999;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    }
}



/**
 * オプションボタンの出現頻度を設定
 */
- (void)OptionFrequency:(id)sender {
    for (int c=0; c<10000; c++){
        if (hairetsu[c] == i){
            oprum = arc4random_uniform(6);;
            break;
        }
    }
}



/*オプションのサウンド処理*/
- (void)OptionSound{
    //音の再生
    int sound = rand()%20;
    NSString *path;
    
    switch (sound) {
        case 0:
            path = [[NSBundle mainBundle] pathForResource:@"meka" ofType:@"mp3"];
            break;
        case 1:
            path = [[NSBundle mainBundle] pathForResource:@"onara" ofType:@"mp3"];
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource:@"ghost" ofType:@"mp3"];
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource:@"fafafa" ofType:@"mp3"];
            break;
        case 4:
            path = [[NSBundle mainBundle] pathForResource:@"howa" ofType:@"mp3"];
            break;
        case 5:
            path = [[NSBundle mainBundle] pathForResource:@"dog" ofType:@"mp3"];
            break;
        case 6:
            path = [[NSBundle mainBundle] pathForResource:@"glass" ofType:@"mp3"];
            break;
        case 7:
            path = [[NSBundle mainBundle] pathForResource:@"xmas" ofType:@"mp3"];
            break;
        case 8:
            path = [[NSBundle mainBundle] pathForResource:@"goki" ofType:@"mp3"];
            break;
        case 9:
            path = [[NSBundle mainBundle] pathForResource:@"suspense" ofType:@"mp3"];
            break;
        case 10:
            path = [[NSBundle mainBundle] pathForResource:@"thinking" ofType:@"mp3"];
            break;
        case 11:
            path = [[NSBundle mainBundle] pathForResource:@"chainsaw" ofType:@"mp3"];
            break;
        case 12:
            path = [[NSBundle mainBundle] pathForResource:@"saw" ofType:@"mp3"];
            break;
        case 13:
            path = [[NSBundle mainBundle] pathForResource:@"pen" ofType:@"mp3"];
            break;
        case 14:
            path = [[NSBundle mainBundle] pathForResource:@"zannen" ofType:@"mp3"];
            break;
        case 15:
            path = [[NSBundle mainBundle] pathForResource:@"tansan" ofType:@"mp3"];
            break;
        case 16:
            path = [[NSBundle mainBundle] pathForResource:@"ka" ofType:@"mp3"];
            break;
        case 17:
            path = [[NSBundle mainBundle] pathForResource:@"metal" ofType:@"mp3"];
            break;
        case 18:
            path = [[NSBundle mainBundle] pathForResource:@"mistake" ofType:@"mp3"];
            break;
        case 19:
            path = [[NSBundle mainBundle] pathForResource:@"drill" ofType:@"mp3"];
            break;
    }
    
    NSURL *url  = [NSURL fileURLWithPath:path];
    
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    
    audio.volume = 0.5;
    audio.numberOfLoops = 0;
    
    [audio prepareToPlay];
    [audio play];
    
}

//効果音
-(void) Effective_sound{
    AudioServicesPlaySystemSound (soundID);
}




/*-(void) incrementI:(UIButton*)button{
    m++;
    [self viewChange:(m)];
    [self Effective_sound];
}*/

-(void)viewChange:(int)ie
{
    CGRect rect = CGRectMake(0,145,320,250);
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    
    NSArray *images = @[
                        [UIImage imageNamed:@"rennga1.jpg"],
                        [UIImage imageNamed:@"rennga2.jpg"],
                        [UIImage imageNamed:@"rennga3.jpg"],
                        [UIImage imageNamed:@"rennga4.jpg"],
                        [UIImage imageNamed:@"rennga5.jpg"],
                        [UIImage imageNamed:@"rennga6.jpg"],
                        [UIImage imageNamed:@"rennga7.jpg"],
                        [UIImage imageNamed:@"rennga8.jpg"],
                        [UIImage imageNamed:@"rennga9.jpg"]
                        ];
    
    //int ia = (1000000 - ie) % 100;
    if(ie == 0) {
        imageView.image = images[0];
    } else if(ie == 100000){
        imageView.image = images[1];
    } else if(ie == 200000){
        imageView.image = images[2];
    } else if(ie == 300000){
        imageView.image = images[3];
    } else if(ie == 400000){
        imageView.image = images[4];
    } else if(ie == 500000){
        imageView.image = images[5];
    } else if(ie == 600000){
        imageView.image = images[6];
    } else if(ie == 700000){
        imageView.image = images[7];
    } else if(ie == 800000){
        imageView.image = images[8];
    } else if(ie == 900000){
        imageView.image = images[9];
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