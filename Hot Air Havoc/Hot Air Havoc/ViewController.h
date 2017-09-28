//
//  ViewController.h
//  Hot Air Havoc
//
//  Created by Colby Tobin on 11/23/14.
//  Copyright (c) 2014 Tobin Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
@interface ViewController : UIViewController<GKGameCenterControllerDelegate>

@property (nonatomic, weak)IBOutlet UILabel* scoreLabel;

@property (nonatomic, weak)IBOutlet UIButton* goButton;
@property (nonatomic, weak)IBOutlet UIButton* leaderboardButton;
@property (nonatomic, weak)IBOutlet UIButton* homeButton;


@end

