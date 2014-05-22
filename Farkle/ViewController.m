//
//  ViewController.m
//  Farkle
//
//  Created by Richard Fellure on 5/21/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController ()<DieLabelDelegate>
@property (weak, nonatomic) IBOutlet DieLabel *dieOne;
@property (weak, nonatomic) IBOutlet DieLabel *dieTwo;
@property (weak, nonatomic) IBOutlet DieLabel *dieThree;
@property (weak, nonatomic) IBOutlet DieLabel *dieFour;
@property (weak, nonatomic) IBOutlet DieLabel *dieFive;
@property (weak, nonatomic) IBOutlet DieLabel *dieSix;
@property NSMutableArray *dice;
@property NSMutableArray *diceToRollAray;
@property NSMutableArray *currentScore;
@property (strong, nonatomic) DieLabel *placeHolderDie;
@property int finalScore;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dieOne.delegate = self;
    self.dieTwo.delegate = self;
    self.dieThree.delegate = self;
    self.dieFour.delegate = self;
    self.dieFive.delegate = self;
    self.dieSix.delegate = self;
    self.diceToRollAray = [NSMutableArray arrayWithObjects:self.dieOne, self.dieTwo, self.dieThree, self.dieFour, self.dieFive, self.dieSix, nil];
    self.dice = [[NSMutableArray alloc]init];
    self.currentScore = [[NSMutableArray alloc]init];

}


- (IBAction)onRollButtonPressed:(id)sender
{
    for (DieLabel *eachDieLabel in self.diceToRollAray) {
        if (![self.dice containsObject:eachDieLabel]){
            [eachDieLabel roll];
            eachDieLabel.value = [eachDieLabel.text integerValue];
            NSLog(@" value %d", eachDieLabel.value);

        }
    }

}

- (void)didChooseDie:(DieLabel *)dieLabel
{
    [self.dice addObject:dieLabel];


    if ([dieLabel.text isEqualToString:@"1"]){
        [self.currentScore addObject:dieLabel];
    }
    else if ([dieLabel.text isEqualToString:@"2"]){
        [self.currentScore addObject:dieLabel];
    }
    else if ([dieLabel.text isEqualToString:@"3"]){
        [self.currentScore addObject:dieLabel];
    }
    else if ([dieLabel.text isEqualToString:@"4"]){
        [self.currentScore addObject:dieLabel];
    }
    else if ([dieLabel.text isEqualToString:@"5"]){
        [self.currentScore addObject:dieLabel];
    }
    else if ([dieLabel.text isEqualToString:@"6"]){
        [self.currentScore addObject:dieLabel];
    }
}

- (IBAction)onEndOfTurnButtonPressed:(id)sender
{
    [self evaluateScore:self.currentScore];
}

-(void)evaluateScore: (NSMutableArray *)array;
{
    int oneScore = 0;
    int twoScore = 0;
    int threeScore = 0;
    int fourScore = 0;
    int fiveScore = 0;
    int sixScore = 0;

    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"value = 1"];
    NSArray *oneArray = [array filteredArrayUsingPredicate:predicate1];
    NSLog(@"one array? %@", oneArray);

    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"value = 2"];
    NSArray *twoArray = [array filteredArrayUsingPredicate:predicate2];

    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"value = 3"];
    NSArray *threeArray = [array filteredArrayUsingPredicate:predicate3];

    NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"value = 4"];
    NSArray *fourArray = [array filteredArrayUsingPredicate:predicate4];

    NSPredicate *predicate5 = [NSPredicate predicateWithFormat:@"value = 5"];
    NSArray *fiveArray = [array filteredArrayUsingPredicate:predicate5];

    NSPredicate *predicate6 = [NSPredicate predicateWithFormat:@"value = 6"];
    NSArray *sixArray = [array filteredArrayUsingPredicate:predicate6];


    NSLog(@" count %d", oneArray.count);
    if (oneArray.count == 6) {
        oneScore = 2000;
    }
    else if (oneArray.count == 5){
        oneScore = 1200;
    }
    else if (oneArray.count == 4){
        oneScore = 1100;
    }
    else if ([oneArray count]== 3) {
        oneScore = 1000;
    }else if ([oneArray count]== 2){
        oneScore = 200;
    }else if ([oneArray count]== 1){
        oneScore = 100;
    }



    if (fiveArray.count == 6){
        fiveScore = 1000;
    }
    else if (fiveArray.count == 5){
        fiveScore = 600;
    }else if (fiveArray.count == 4){
        fiveScore = 550;
    }
    else if ([fiveArray count]== 3) {
        fiveScore = 500;
    }else if (fiveArray.count == 2){
        fiveScore = 100;
    }else if (fiveArray.count == 1){
        fiveScore = 50;
    }

    if (sixArray.count == 6) {
        sixScore = 1200;
    }
    else if (sixArray.count == 3){
        sixScore = 600;
    }

    if (fourArray.count == 6) {
        sixScore = 800;
    }
    else if (fourArray.count == 3){
        fourScore = 400;
    }

    if (threeArray.count == 6) {
        threeScore = 600;
    }
    else if (threeArray.count == 3){
        threeScore = 300;
    }

    if (twoArray.count == 6) {
        twoScore = 400;
    }
    else if (twoArray.count == 3){
        twoScore = 200;
    }

    self.finalScore = oneScore + twoScore + threeScore + fourScore + fiveScore + sixScore;
    self.playerOneScore.text = [NSString stringWithFormat:@"%d", self.finalScore];
    NSLog(@"%d %@ %@",oneScore, oneArray, self.currentScore);
}






@end
