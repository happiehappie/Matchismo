//
//  Deck.h
//  Matchismo
//
//  Created by Jack Xiong Lim on 12/13/13.
//  Copyright (c) 2013 Jack Xiong Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard: (Card *)card atTop: (BOOL)atTop;
-(void)addCard:(Card *)card;


-(Card *)drawRandomCard;

@end
