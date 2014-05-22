//
//  DieLabel.h
//  Farkle
//
//  Created by Richard Fellure on 5/21/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DieLabelDelegate
- (void)didChooseDie:(id)dieLabel;
@end

@interface DieLabel : UILabel

@property id<DieLabelDelegate> delegate;
- (void)roll;
@property int randomNumber;
@property NSInteger value;

@end
