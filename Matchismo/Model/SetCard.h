//
//  SetCard.h
//  Matchismo
//
//  Created by Jack Xiong Lim on 1/20/14.
//  Copyright (c) 2014 Jack Xiong Lim. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *shading;
@property (nonatomic) NSUInteger number;

+ (NSArray *)validSymbols;
+ (NSArray *)validColors;
+ (NSArray *)validShading;
+ (NSUInteger)maxNumber;

@end
