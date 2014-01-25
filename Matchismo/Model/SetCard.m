//
//  SetCard.m
//  Matchismo
//
//  Created by Jack Xiong Lim on 1/20/14.
//  Copyright (c) 2014 Jack Xiong Lim. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
@synthesize symbol = _symbol;
@synthesize color = _color;
@synthesize shading = _shading;


+ (NSArray *)validSymbols
{
    return @[@"▲", @"●", @"■"];
}

- (void)setSymbol:(NSString *)symbol
{
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

+ (NSArray *)validColors
{
    return @[@"red", @"green", @"purple"];
}

- (void)setColor:(NSString *)color
{
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

+ (NSArray *)validShading
{
    return @[@"solid", @"stripped", @"open"];
}

- (void)setShading:(NSString *)shading
{
    if ([[SetCard validShading] containsObject:shading]) {
        _shading = shading;
    }
}

+ (NSUInteger)maxNumber
{
    return 3;
}

- (void)setNumber:(NSUInteger)number
{
    if(number <= [SetCard maxNumber]){
        _number = number;
    }
}

- (NSString *)contents
{
    return [NSString stringWithFormat:@"%@%@%@%d", self.symbol, self.color, self.shading, self.number];
}



@end
