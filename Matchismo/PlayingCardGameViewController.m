//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Jack Xiong Lim on 1/19/14.
//  Copyright (c) 2014 Jack Xiong Lim. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"


@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}



@end
