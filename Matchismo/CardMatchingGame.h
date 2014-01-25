//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Jack Xiong Lim on 12/13/13.
//  Copyright (c) 2013 Jack Xiong Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "PlayingCard.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck: (Deck *) deck;

-(void)chooseCardAtIndex:(NSUInteger)index
                gameMode:(NSUInteger)maxNumberOfCards;
-(Card *)cardAtIndex:(NSUInteger)index;

-(NSString *)updateOneCardChooseResult:(Card *) card;
-(NSString *)updateMultipleCardResult:(NSMutableArray *)cards
                              ifMatch:(BOOL)matched
                              worthOf:(int)points;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSUInteger maxMatchingCards;
@property (nonatomic) BOOL match;
@property (strong, nonatomic)NSString *result;
@end
