//
//  DieLabel.m
//  Farkle
//
//  Created by Richard Fellure on 5/21/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "DieLabel.h"
@interface DieLabel ()
@property int lowerBound;
@property int upperBound;

@end


@implementation DieLabel

-(void)roll
{
    self.randomNumber = arc4random_uniform(6)+1;
    self.text = [NSString stringWithFormat:@"%d", self.randomNumber];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    if (self) {
        self.randomNumber = arc4random_uniform(5)+1;
        self.text = [NSString stringWithFormat:@"%d", self.randomNumber];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapped:)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

-(IBAction)onTapped:(id)sender
{
    
    [self.delegate didChooseDie:self];
    [self setBackgroundColor: [UIColor blueColor]];
}

@end
