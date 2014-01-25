//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Jack Xiong Lim on 12/13/13.
//  Copyright (c) 2013 Jack Xiong Lim. All rights reserved.
//

//abstract class, must implement methods described below.

#import <UIKit/UIKit.h>
#import "Deck.h"


@interface CardGameViewController : UIViewController



//protected
//for subclassing
-(Deck *)createDeck; //abstract

@end
