//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Jack Xiong Lim on 12/13/13.
//  Copyright (c) 2013 Jack Xiong Lim. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "SetMatchingGame.h"

@interface CardGameViewController ()

@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *setCardButtons;
@property (strong, nonatomic) CardMatchingGame *cardMatchingGame;
@property (strong, nonatomic) SetMatchingGame *setMatchingGame;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSelector;

@end

@implementation CardGameViewController

- (IBAction)deal
{
    self.cardMatchingGame = nil;
    [self newGame];
    self.modeSelector.enabled = YES;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.cardMatchingGame.score];
    [self updateUI];
    self.resultLabel.text = @"Result";
}

- (CardMatchingGame *) cardMatchingGame
{
    if (!_cardMatchingGame) {
        _cardMatchingGame = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                             usingDeck:[self createDeck]];
        [self changeModeSelector:self.modeSelector];
    }
    return _cardMatchingGame;
}

- (SetMatchingGame *)setMatchingGame
{
    if (!_setMatchingGame) {
        _setMatchingGame = [[SetMatchingGame alloc]initWithCardCount:[self.setCardButtons count]
                                                           usingDeck:[self createDeck]];
    }
    return _setMatchingGame;
}

- (Deck *)createDeck //abstract
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    self.modeSelector.enabled = NO;
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.cardMatchingGame chooseCardAtIndex:cardIndex
                        gameMode:self.cardMatchingGame.maxMatchingCards];
    self.resultLabel.text = self.cardMatchingGame.result;
    
    [self updateUI];
        
}


-(void)newGame
{
    for (UIButton *cardButton in self.cardButtons) {
        
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
        cardButton.enabled = YES;
        
        
    }
}

- (IBAction)changeModeSelector:(UISegmentedControl *)sender {
    
    self.cardMatchingGame.maxMatchingCards = [[sender titleForSegmentAtIndex:sender.selectedSegmentIndex] integerValue];
    
}


-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.cardMatchingGame cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.cardMatchingGame.score];
}

-(NSString *) titleForCard: (Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *) backgroundImageForCard: (Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
