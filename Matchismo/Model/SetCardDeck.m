//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Jack Xiong Lim on 1/21/14.
//  Copyright (c) 2014 Jack Xiong Lim. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"
@implementation SetCardDeck

- (instancetype)init
{
    self = [super init];
    
    if(self){
        for (NSString *symbol in [SetCard validSymbols]) {
            for (NSString *color in [SetCard validColors]) {
                for (NSString *shading in [SetCard validShading]) {
                    for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
                        SetCard *card = [[SetCard alloc]init];
                        card.symbol = symbol;
                        card.color = color;
                        card.shading = shading;
                        card.number = number;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    
    return self;
    
}

@end
