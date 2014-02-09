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

UILabel *label; // オプション用ラベル
UILabel *labeltouch; // 壁たたけ用ラベル

                     // オプションボタン、出現頻度のための作業用変数宣言
int k = 50000;       // 100万のうちに、何回オプションボタンを出現させるか (とりあえず5万回)
int hairetsu[50000]; // 配列に乱数を格納するための変数
int oprum = 10;      // どの位置にボタンを表示させるかに使用する乱数の格納変数



@synthesize soundURL;
@synthesize soundID;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 「たたけ」というラベル表示
    labeltouch = [[UILabel alloc] init];
    labeltouch.backgroundColor = [UIColor whiteColor];
    labeltouch.frame = CGRectMake(100, 430, 125, 40);
    labeltouch.textColor = [UIColor blackColor];
    labeltouch.font = [UIFont fontWithName:@"Hiragino Kaku Gothic ProN W6" size:22];
    labeltouch.text = @"壁を叩いて!!";
    [self.view addSubview:labeltouch];
    
    i=999899;
    
    // オプションボタンの出現位置をランダムで決定
    for (int c=0; c<k ;c++){
        hairetsu[c] = arc4random_uniform(1000000);
        printf("%d\n", 1000000 - hairetsu[c]);
    }
    
    
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
    label.hidden = YES;
    labeltouch.hidden = YES;
    
    OPbtn1.hidden = YES;
    OPbtn2.hidden = YES;
    OPbtn3.hidden = YES;
    OPbtn4.hidden = YES;
    OPbtn5.hidden = YES;
    OPbtn6.hidden = YES;
    
    [self viewChange:(i)];
    [self Effective_sound];
    
    
    // ここに処理を書く
    i++;
    counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
    
    
    // オプションボタンの頻度設定
    // 乱数の値とiが同じになればオプションボタン表示あせるようにする
    for (int c=0; c<k; c++){
        if (hairetsu[c] == i){
            oprum = arc4random_uniform(6) + 1;
            break;
        }
    }
    
    if (oprum < 10) {
        int a = (oprum / 3) + 1;
        for (int s=0; s<a; s++){
        
            if       (oprum == 1){
                OPbtn1.hidden = NO;
            }else if (oprum == 2){
                OPbtn2.hidden = NO;
            }else if (oprum == 3){
                OPbtn3.hidden = NO;
            }else if (oprum == 4){
                OPbtn4.hidden = NO;
            }else if (oprum == 5){
                OPbtn5.hidden = NO;
            }else if (oprum == 6){
                OPbtn6.hidden = NO;
            }
            oprum = arc4random_uniform(6) + 1;
        }
        oprum = 10;
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
    
    
    // オプションボタン用 ラベルの生成
    label = [[UILabel alloc] init];
    label.frame = CGRectMake(40, 10, 200, 50);
    label.textColor = [UIColor blueColor];
    label.font = [UIFont fontWithName:@"AppleGothic" size:12];
    [self.view addSubview:label];
    
    
    if (a<6){                              //カウントを1000000に(リセット)する
        i = 0;
        counter.text = @"1000000";
        label.text = @"カウントリセットを行いました^^";
    }else if (6<a && a<9){                 //カウントを500000にする
        i = 500000;
        counter.text = @"500000";
        label.text = @"カウントを500000にセット^^";
    }else if (a == 10){                    //カウントを100にする
        i = 999900;
        counter.text = @"100";
        label.text = @"カウントを   100にセット^^";
    }else if (10<a && a<25){               //カウントを+1000する
        i = i - 1000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
        label.text = @"カウントを  +1000しました^^";
    }else if (25<a && a<40){               //カウントを-1000する
        i = i + 1000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
        label.text = @"カウントを  -1000しました^^";
    }else if (40<a && a<45){               //カウントを+100000する
        i = i - 100000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
        label.text = @"カウントを+100000しました^^";
    }else if (45<a && a<50){               //カウントを-100000する
        i = i + 100000;
        counter.text = [NSString stringWithFormat:@"%d",1000000 - i];
        label.text = @"カウントを-100000しました^^";
    }else {
        label.text = @"          何もしてないよ^^";
    }
    [self.view addSubview:label];
    
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
                        [UIImage imageNamed:@"rennga9.jpg"],
                        [UIImage imageNamed:@"rennga10.jpg"],
                        [UIImage imageNamed:@"rennga11.jpg"],
                        [UIImage imageNamed:@"rennga12.jpg"],
                        [UIImage imageNamed:@"rennga13.jpg"],
                        [UIImage imageNamed:@"rennga14.jpg"],
                        [UIImage imageNamed:@"rennga15.jpg"],
                        [UIImage imageNamed:@"rennga16.jpg"],
                        [UIImage imageNamed:@"rennga17.jpg"],
                        [UIImage imageNamed:@"rennga18.jpg"],
                        [UIImage imageNamed:@"rennga19.jpg"],
                        [UIImage imageNamed:@"rennga20.jpg"],
                        [UIImage imageNamed:@"rennga21.jpg"],
                        [UIImage imageNamed:@"rennga22.jpg"],
                        [UIImage imageNamed:@"rennga23.jpg"],
                        [UIImage imageNamed:@"rennga24.jpg"],
                        [UIImage imageNamed:@"rennga25.jpg"],
                        [UIImage imageNamed:@"rennga26.jpg"],
                        [UIImage imageNamed:@"rennga27.jpg"],
                        [UIImage imageNamed:@"rennga28.jpg"],
                        [UIImage imageNamed:@"rennga29.jpg"],
                        [UIImage imageNamed:@"rennga30.jpg"],
                        [UIImage imageNamed:@"rennga31.jpg"],
                        [UIImage imageNamed:@"rennga32.jpg"],
                        [UIImage imageNamed:@"rennga33.jpg"],
                        [UIImage imageNamed:@"rennga34.jpg"],
                        [UIImage imageNamed:@"rennga35.jpg"],
                        [UIImage imageNamed:@"rennga36.jpg"],
                        [UIImage imageNamed:@"rennga37.jpg"],
                        [UIImage imageNamed:@"rennga38.jpg"],
                        [UIImage imageNamed:@"rennga39.jpg"],
                        [UIImage imageNamed:@"rennga40.jpg"],
                        [UIImage imageNamed:@"rennga41.jpg"],
                        [UIImage imageNamed:@"rennga42.jpg"],
                        [UIImage imageNamed:@"rennga43.jpg"],
                        [UIImage imageNamed:@"rennga44.jpg"],
                        [UIImage imageNamed:@"rennga45.jpg"],
                        [UIImage imageNamed:@"rennga46.jpg"],
                        [UIImage imageNamed:@"rennga47.jpg"],
                        [UIImage imageNamed:@"rennga48.jpg"],
                        [UIImage imageNamed:@"rennga49.jpg"],
                        [UIImage imageNamed:@"rennga50.jpg"]
                        ];
    
    //int ia = (1000000 - ie) % 100;
    if(0 <= ie && ie < 100) {
        imageView.image = images[0];
    } else if(100 <= ie && ie < 200){
        imageView.image = images[1];
    } else if(200 <= ie && ie < 300){
        imageView.image = images[2];
    } else if(300 <= ie && ie < 400){
        imageView.image = images[3];
    } else if(400 <= ie && ie < 500){
        imageView.image = images[4];
    } else if(500 <= ie && ie < 800){
        imageView.image = images[5];
    } else if(800 <= ie && ie < 1000){
        imageView.image = images[6];
    } else if(1000 <= ie && ie < 10000){
        imageView.image = images[7];
    } else if(10000 <= ie && ie < 30000){
        imageView.image = images[8];
    } else if(30000 <= ie && ie < 50000){
        imageView.image = images[9];
    } else if(50000 <= ie && ie < 100000){
        imageView.image = images[10];
    } else if(100000 <= ie && ie < 150000){
        imageView.image = images[11];
    } else if(150000 <= ie && ie < 200000){
        imageView.image = images[12];
    } else if(200000 <= ie && ie < 250000){
        imageView.image = images[13];
    } else if(250000 <= ie && ie < 300000){
        imageView.image = images[14];
    } else if(300000 <= ie && ie < 350000){
        imageView.image = images[15];
    } else if(350000 <= ie && ie < 400000){
        imageView.image = images[16];
    } else if(400000 <= ie && ie < 450000){
        imageView.image = images[17];
    } else if(450000 <= ie && ie < 500000){
        imageView.image = images[18];
    } else if(500000 <= ie && ie < 550000){
        imageView.image = images[19];
    } else if(550000 <= ie && ie < 600000){
        imageView.image = images[20];
    } else if(600000 <= ie && ie < 650000){
        imageView.image = images[21];
    } else if(650000 <= ie && ie < 700000){
        imageView.image = images[22];
    } else if(700000 <= ie && ie < 750000){
        imageView.image = images[23];
    } else if(750000 <= ie && ie < 800000){
        imageView.image = images[24];
    } else if(800000 <= ie && ie < 850000){
        imageView.image = images[25];
    } else if(850000 <= ie && ie < 860000){
        imageView.image = images[26];
    } else if(860000 <= ie && ie < 870000){
        imageView.image = images[27];
    } else if(870000 <= ie && ie < 880000){
        imageView.image = images[28];
    } else if(880000 <= ie && ie < 890000){
        imageView.image = images[29];
    } else if(890000 <= ie && ie < 900000){
        imageView.image = images[30];
    } else if(900000 <= ie && ie < 901000){
        imageView.image = images[31];
    } else if(901000 <= ie && ie < 902000){
        imageView.image = images[32];
    } else if(902000 <= ie && ie < 903000){
        imageView.image = images[33];
    } else if(903000 <= ie && ie < 904000){
        imageView.image = images[34];
    } else if(904000 <= ie && ie < 905000){
        imageView.image = images[35];
    } else if(905000 <= ie && ie < 908000){
        imageView.image = images[36];
    } else if(908000 <= ie && ie < 910000){
        imageView.image = images[37];
    } else if(910000 <= ie && ie < 930000){
        imageView.image = images[38];
    } else if(930000 <= ie && ie < 950000){
        imageView.image = images[39];
    } else if(950000 <= ie && ie < 970000){
        imageView.image = images[40];
    } else if(970000 <= ie && ie < 990000){
        imageView.image = images[41];
    } else if(990000 <= ie && ie < 994000){
        imageView.image = images[42];
    } else if(994000 <= ie && ie < 998000){
        imageView.image = images[43];
    } else if(998000 <= ie && ie < 999500){
        imageView.image = images[44];
    } else if(999500 <= ie && ie < 999600){
        imageView.image = images[45];
    } else if(999600 <= ie && ie < 999700){
        imageView.image = images[46];
    } else if(999700 <= ie && ie < 999800){
        imageView.image = images[47];
    } else if(999800 <= ie && ie < 999900){
        imageView.image = images[48];
    } else if(999900 <= ie){
        imageView.image = images[49];
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
            [self viewChange:(i)];
            break;
            
        default: // キャンセルが押されたとき
            NSLog(@"キャンセル");
            i = 0;
            counter.text = @"1000000";
            [self viewChange:(i)];
            break;

    }
    

}

@end