//
//  ViewController.m
//  Hot Air Havoc
//
//  Created by Colby Tobin on 11/23/14.
//  Copyright (c) 2014 Tobin Technologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *hotAir;
    
    UIImageView *dart1;
    UIImageView *dart2;
    UIImageView *dart3;
    UIImageView *dart4;
    UIImageView *dart5;
    
    
    NSTimer *update;
    
    double x1;
    double y1;
    
    double x2;
    double y2;
    
    double x3;
    double y3;
    
    double x4;
    double y4;
    
    double x5;
    double y5;
    
    NSInteger count;
    NSInteger score;
    NSInteger highscore;
    
    BOOL lose;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    highscore = 0;
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"highscore"]!=nil){
        highscore = [[NSUserDefaults standardUserDefaults]integerForKey:@"highscore"];
    }
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    background.image = [UIImage imageNamed:@"colbysky.png"];
    [self.view addSubview:background];
    hotAir = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 25, self.view.frame.size.height/2 - 50, 50, 75)];
    hotAir.image = [UIImage imageNamed:@"hotair.png"];
    [self.view addSubview:hotAir];
    score = 0;
    count = 0;
    lose = NO;
    
    x1 = 1 + arc4random() % 3;
    x2 = 1 + arc4random() % 3;
    y1 = 1 + arc4random() % 3;
    y2 = 1 + arc4random() % 3;
    x3 = 1 + arc4random() % 3;
    x4 = 1 + arc4random() % 3;
    y3 = 1 + arc4random() % 3;
    y4 = 1 + arc4random() % 3;
    x5 = 1 + arc4random() % 3;
    y5 = 1 + arc4random() % 3;
    
    
    
    dart1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    dart2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-20, 0, 40, 40)];
    dart3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-20, 40, 40)];
    dart4 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-20, self.view.frame.size.height-20, 40, 40)];
    dart5 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    
     dart1.image = [UIImage imageNamed:@"ninja.png"];
     dart2.image = [UIImage imageNamed:@"ninja.png"];
     dart3.image = [UIImage imageNamed:@"ninja.png"];
     dart4.image = [UIImage imageNamed:@"ninja.png"];
     dart5.image = [UIImage imageNamed:@"ninja.png"];
    
    [self.view addSubview:dart1];
    [self.view addSubview:dart2];
    [self.view addSubview:dart3];
    [self.view addSubview:dart4];
    [self.view addSubview:dart5];
    
    update = [NSTimer scheduledTimerWithTimeInterval:(1.0/60.0) target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    [self.view bringSubviewToFront:self.scoreLabel];
    [self.view bringSubviewToFront:self.leaderboardButton];
    [self.view bringSubviewToFront:self.homeButton];
    [self.view bringSubviewToFront:self.goButton];
    
    self.leaderboardButton.hidden = YES;
    self.homeButton.hidden = YES;
    self.goButton.hidden = YES;
    
    [super viewDidLoad];
}

-(void)update{
    count++;
    if(count%60==0){
        score++;
        [self.scoreLabel setText:[NSString stringWithFormat:@"%i s",(int)score]];
        
        if(score %10 == 0){
            if(x1 >= 0){
                x1 += 0.5;
            }else{
                x1 -= 0.5;
            }
            
            if(x2 >= 0){
                x2 += 0.5;
            }else{
                x2 -= 0.5;
            }
            
            if(x3 >= 0){
                x3 += 0.5;
            }else{
                x3 -= 0.5;
            }
            
            if(x4 >= 0){
                x4 += 0.5;
            }else{
                x4 -= 0.5;
            }
            
            if(x5 >= 0){
                x5 += 0.5;
            }else{
                x5 -= 0.5;
            }
            
            if(y1 >= 0){
                y1 += 0.5;
            }else{
                y1 -= 0.5;
            }
            
            if(y2 >= 0){
                y2 += 0.5;
            }else{
                y2 -= 0.5;
            }
            
            if(y3 >= 0){
                y3 += 0.5;
            }else{
                y3 -= 0.5;
            }
            
            if(y4 >= 0){
                y4 += 0.5;
            }else{
                y4 -= 0.5;
            }
            
            if(y5 >= 0){
                y5 += 0.5;
            }else{
                y5 -= 0.5;
            }
        }
        
    }
    
    
    
    dart1.center = CGPointMake(dart1.center.x + x1, dart1.center.y + y1);
    dart2.center = CGPointMake(dart2.center.x + x2, dart2.center.y + y2);
    dart3.center = CGPointMake(dart3.center.x + x3, dart3.center.y + y3);
    dart4.center = CGPointMake(dart4.center.x + x4, dart4.center.y + y4);
    dart5.center = CGPointMake(dart5.center.x + x5, dart5.center.y + y5);
    
    if(dart1.center.x > self.view.frame.size.width || dart1.center.x < 0 ){
        x1 = -x1;
    }
       if(dart1.center.y > self.view.frame.size.height || dart1.center.y < 0){
        
        y1 = -y1;
    }
    
    if(dart2.center.x > self.view.frame.size.width || dart2.center.x < 0){
        x2 = -x2;
    }
      if( dart2.center.y > self.view.frame.size.height || dart2.center.y < 0){
        
        y2 = -y2;
    }

    if(dart3.center.x > self.view.frame.size.width || dart3.center.x < 0 ){
        x3 = -x3;
    }
    if(   dart3.center.y > self.view.frame.size.height || dart3.center.y < 0){
        
        y3 = -y3;
    }
    
    if(dart4.center.x > self.view.frame.size.width || dart4.center.x < 0){
        x4 = -x4;
    }
     if(  dart4.center.y > self.view.frame.size.height || dart4.center.y < 0){
        
        y4 = -y4;
    }
    if(dart5.center.x > self.view.frame.size.width || dart5.center.x < 0){
        x5 = -x5;
    }
     if(  dart5.center.y > self.view.frame.size.height || dart5.center.y < 0){
        
        y5 = -y5;
    }
    [self checkCollision];
}

-(void)checkCollision{
    BOOL collide = NO;
    if(CGRectIntersectsRect(dart1.frame, hotAir.frame)){
        collide = YES;
        dart1.center = hotAir.center;
    }
    else if(CGRectIntersectsRect(dart2.frame, hotAir.frame)){
        collide = YES;
        dart2.center = hotAir.center;
    }
   else if(CGRectIntersectsRect(dart3.frame, hotAir.frame)){
       collide = YES;
       dart3.center = hotAir.center;
    }
    else if(CGRectIntersectsRect(dart4.frame, hotAir.frame)){
        collide = YES;
        dart4.center = hotAir.center;
    }
   else if(CGRectIntersectsRect(dart5.frame, hotAir.frame)){
       collide = YES;
       dart5.center = hotAir.center;
    }
    
    if(collide){
        [update invalidate];
        lose = YES;
        self.goButton.hidden = NO;
        self.leaderboardButton.hidden = NO;
        self.homeButton.hidden = NO;
        if(score > highscore){
            highscore = score;
            [self reportScore];
            [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"highscore"];
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGRect rect = CGRectMake(hotAir.center.x - hotAir.frame.size.width/2 - 7.5, hotAir.center.y - hotAir.frame.size.height/2 - 7.5, hotAir.frame.size.width+15, hotAir.frame.size.height+15);
    if(!lose && CGRectContainsPoint(rect, [touch locationInView:self.view]))
    hotAir.center = [touch locationInView:self.view];
    
}
- (IBAction)go:(id)sender {
    
    score = 0;
    count = 0;
    lose = NO;
    
    x1 = 1 + arc4random() % 3;
    x2 = 1 + arc4random() % 3;
    y1 = 1 + arc4random() % 3;
    y2 = 1 + arc4random() % 3;
    x3 = 1 + arc4random() % 3;
    x4 = 1 + arc4random() % 3;
    y3 = 1 + arc4random() % 3;
    y4 = 1 + arc4random() % 3;
    x5 = 1 + arc4random() % 3;
    y5 = 1 + arc4random() % 3;
    
    hotAir.frame = CGRectMake(self.view.frame.size.width/2 - 25, self.view.frame.size.height/2 - 50, 50, 75);
    
    dart1.frame = CGRectMake(0, 0, 40, 40);
    dart2.frame = CGRectMake(self.view.frame.size.width-20, 0, 40, 40);
    dart3.frame = CGRectMake(0, self.view.frame.size.height-20, 40, 40);
    dart4.frame = CGRectMake(self.view.frame.size.width-20, self.view.frame.size.height-20, 40, 40);
    dart5.frame = CGRectMake(0, 0, 40, 40);
    
    [self.scoreLabel setText:@"0 s"];
    update = [NSTimer scheduledTimerWithTimeInterval:(1.0/60.0) target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    [self.view bringSubviewToFront:self.scoreLabel];
    [self.view bringSubviewToFront:self.leaderboardButton];
    [self.view bringSubviewToFront:self.homeButton];
    [self.view bringSubviewToFront:self.goButton];
    
    self.leaderboardButton.hidden = YES;
    self.homeButton.hidden = YES;
    self.goButton.hidden = YES;
    
    
}


-(void)reportScore{
    GKScore *gkScore = [[GKScore alloc] initWithLeaderboardIdentifier:@"ft1177"];
    gkScore.value = score;
    
    [GKScore reportScores:@[gkScore] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)showLeaderboardAndAchievements:(BOOL)shouldShowLeaderboard{
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    
    gcViewController.gameCenterDelegate = self;
    
    if (shouldShowLeaderboard) {
        gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gcViewController.leaderboardIdentifier = @"ft1177";
    }
    
    
    [self presentViewController:gcViewController animated:YES completion:nil];
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)leaderboards:(id)sender {
    [self showLeaderboardAndAchievements:YES];
}
- (IBAction)home:(id)sender {
    [self performSegueWithIdentifier:@"back" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
