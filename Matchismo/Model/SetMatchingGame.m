//
//  SetMatchingGame.m
//  Matchismo
//
//  Created by Jack Xiong Lim on 1/21/14.
//  Copyright (c) 2014 Jack Xiong Lim. All rights reserved.
//

#import "SetMatchingGame.h"

@interface SetMatchingGame ()
@property (nonatomic, strong) NSMutableArray *setOfCards;
@end

@implementation SetMatchingGame

- (NSMutableArray *)setOfCards
{
    if (!_setOfCards) {
        _setOfCards = [[NSMutableArray alloc]init];
    }
    return _setOfCards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck: (Deck *) deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.setOfCards addObject:card];
                NSLog(@"%@", card.contents);
            }else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}

@end
