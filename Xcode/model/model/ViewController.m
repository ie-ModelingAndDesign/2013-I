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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // ボタンを作成
    UIButton *button =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // ボタンの位置を設定
    button.center = CGPointMake(120, 400);
    
    // キャプションを設定
    [button setTitle:@"ボタンサンプル"
            forState:UIControlStateNormal];
    
    // キャプションに合わせてサイズを設定
    [button sizeToFit];
    
    // ボタンがタップされたときに呼ばれるメソッドを設定
    [button addTarget:self
               action:@selector(incrementI:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button addTarget:self
               action:@selector(button_Tapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // ボタンをビューに追加
    [self.view addSubview:button];
    
    [self viewChange:(m)];
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

@end
