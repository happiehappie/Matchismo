//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Jack Xiong Lim on 12/13/13.
//  Copyright (c) 2013 Jack Xiong Lim. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame


-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck: (Deck *) deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}



static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
                gameMode:(NSUInteger)maxNumberOfCards
{
    Card *card = [self cardAtIndex:index];
    self.result = [self updateOneCardChooseResult:card];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
            
        } else {
            //match against other card
            
            //add the previous chosen card to the array chosenCards
            NSMutableArray *chosenCards = [NSMutableArray array];
            
            //add in cards to NSMutableArray chosenCards for matching
            for (PlayingCard *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                }
                
            }
            
            //check if the first two cards match when game mode = 3
            if (maxNumberOfCards > 2 && [chosenCards count] > 0) {
                BOOL matchBool= [card match:chosenCards];
                
                //face down all chosen cards if first two cards doesn't match
                if (!matchBool) {
                    self.result = [self updateMultipleCardResult:chosenCards
                                           ifMatch:NO
                                           worthOf:MISMATCH_PENALTY];
                    card.chosen = NO;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.chosen = NO;
                    }
                }
            }
            
            
            //start matching ONLY when user selected that amount of cards
            if ([chosenCards count] == maxNumberOfCards - 1) {
                
                //match chosenCards
                int matchScore = [card match:chosenCards];
                
                
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    
                    //update resultLabel
                    self.result = [self updateMultipleCardResult:chosenCards
                                                         ifMatch:YES
                                                         worthOf:matchScore * MATCH_BONUS];
                    
                    card.matched = YES;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.matched = YES;
                    }
                } else {
                    self.score -= MISMATCH_PENALTY;
                    self.result = [self updateMultipleCardResult:chosenCards
                                                         ifMatch:NO
                                                         worthOf:MISMATCH_PENALTY];
                    card.chosen = NO;
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.chosen = NO;
                    }
                }
            }
            
            
            
            //mark the card as face up by default
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
}

-(NSString *)updateOneCardChooseResult:(Card *)card
{
    return card.contents;
}

-(NSString *)updateMultipleCardResult:(NSMutableArray *)cards//of cards
                              ifMatch:(BOOL)match
                              worthOf:(int)points;
{
    NSString *appendString;
    for (Card *currentCard in cards) {
        self.result = [self.result stringByAppendingString:currentCard.contents];
    }
    if (match) {
        appendString = [NSString stringWithFormat:@"matched for %d points", points];
        self.result = [self.result stringByAppendingString:appendString];
    } else {
        appendString = [NSString stringWithFormat:@"not matched, minus %d points", points];
        self.result = [self.result stringByAppendingString:appendString];
    }
    return self.result;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

-(instancetype)init
{
    return nil;
}

@end
