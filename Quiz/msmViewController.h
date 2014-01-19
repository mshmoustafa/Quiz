//
//  msmViewController.h
//  Quiz
//
//  Created by Muhammad-Sharif Moustafa on 1/15/14.
//  Copyright (c) 2014 Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h> //this is the framework for UI

@interface msmViewController : UIViewController //msmViewController is a subclass of UIViewController

{
    int currentQuestionIndex;
    
    //the model objects
    NSMutableArray *questions;
    NSMutableArray *answers;
}

- (IBAction)showQuestion:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel; //properties are like variables. In this case this is a pointer to the question label
- (IBAction)showAnswer:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
