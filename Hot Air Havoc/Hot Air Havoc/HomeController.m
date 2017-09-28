//
//  HomeController.m
//  Hot Air Havoc
//
//  Created by Colby Tobin on 12/25/14.
//  Copyright (c) 2014 Tobin Technologies. All rights reserved.
//

#import "HomeController.h"

@interface HomeController (){
    NSString *leaderboard;
}

@end

@implementation HomeController

- (void)viewDidLoad {
    [self authenticateLocalPlayer];
    UIImageView *background = [[UIImageView alloc]initWithFrame:self.view.frame];
    background.image = [UIImage imageNamed:@"colbysky.png"];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

-(IBAction)showLeaderboard:(id)sender{
    [self showLeaderboardAndAchievements:YES];
}

-(void)authenticateLocalPlayer{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                //_gameCenterEnabled = YES;
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        NSLog(@"logged in");
                        leaderboard = @"ft1177";
                    }
                }];
            }
            
            else{
                // _gameCenterEnabled = NO;
            }
        }
    };
}

-(void)showLeaderboardAndAchievements:(BOOL)shouldShowLeaderboard{
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    
    gcViewController.gameCenterDelegate = self;
    
    if (shouldShowLeaderboard) {
        gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gcViewController.leaderboardIdentifier = leaderboard;
    }
    
    
    [self presentViewController:gcViewController animated:YES completion:nil];
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
