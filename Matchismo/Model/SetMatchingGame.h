//
//  SetMatchingGame.h
//  Matchismo
//
//  Created by Jack Xiong Lim on 1/21/14.
//  Copyright (c) 2014 Jack Xiong Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "SetCard.h"

@interface SetMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck: (Deck *) deck;

@end
