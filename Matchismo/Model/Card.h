//
//  Card.h
//  Matchismo
//
//  Created by Jack Xiong Lim on 12/13/13.
//  Copyright (c) 2013 Jack Xiong Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end
