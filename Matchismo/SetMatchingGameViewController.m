//
//  SetMatchingGameViewController.m
//  Matchismo
//
//  Created by Jack Xiong Lim on 1/21/14.
//  Copyright (c) 2014 Jack Xiong Lim. All rights reserved.
//

#import "SetMatchingGameViewController.h"
#import "SetCardDeck.h"
@interface SetMatchingGameViewController ()

@end

@implementation SetMatchingGameViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
    // Do any additional setup after loading the view.
}
- (IBAction)test:(UIButton *)sender {
    
    NSLog(@"%@", [sender currentTitle]);
}

- (Deck *)createDeck
{
    return [[SetCardDeck alloc]init];
}

- (void)updateUI
{
    
}

@end
