//
//  msmViewController.m
//  Quiz
//
//  Created by Muhammad-Sharif Moustafa on 1/15/14.
//  Copyright (c) 2014 Sharif Moustafa. All rights reserved.
//

//initWithNibName:bundle: is not called at the start of the program for some reason. I got around it by calling it in viewDidLoad, which is called at the start of the program

#import "msmViewController.h"

@interface msmViewController ()

@end

@implementation msmViewController


//Although the textbook says to put the initialization code in initWithNibName:bundle:, this method isn't actually called by the AppDelegate for whatever reason. I know this because the NSLog() statements do not log anything to the console.  Instead, I put the initialization code in its own method called createAndSetQuestionsAndAnswers (for ease of access) and decided to call it from viewDidLoad, which apparently is called at startup.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //initialize msmViewController, including the answer and questions
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        currentQuestionIndex = 0;
        [self createAndSetQuestionsAndAnswers];
    }
    else {
        NSLog(@"not self");
    }
    NSLog(@"done with init");
    return self;
}

- (void)createAndSetQuestionsAndAnswers {
    //create two arrays and make the pointers point to them
    questions = [[NSMutableArray alloc] init];
    answers = [[NSMutableArray alloc] init];
    
    [questions addObject:@"What is 7 + 7?"];
    [answers addObject:@"14"];
    
    [questions addObject:@"What is the capital of Vermont"];
    [answers addObject:@"Montpelier"];
    
    [questions addObject:@"From what is cognac made?"];
    [answers addObject:@"Grapes"];
    
    //for debugging purposes
    NSLog(@"questions count = %d", [questions count]);
    NSLog(@"answers count = %d", [answers count]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createAndSetQuestionsAndAnswers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showQuestion:(id)sender {
//    NSLog(@"Show Question");
    //@ is Objective C. In this specific case, the string is an NS string, which is an object
    //NSLog logs output (a string in this case) in the debugger
    //to bring up docs, alt click code
    
    //Step to the next question
    currentQuestionIndex++;
    NSLog(@"current question index = %d", currentQuestionIndex);
    
    //Am I past the last question?
    if (currentQuestionIndex == [questions count]) {
        //Go back to first question
        currentQuestionIndex = 0;
    }
    
    //Get the string at that index in the questions array
    NSString *question = [questions objectAtIndex:currentQuestionIndex];
    
    //Log the string to the console
    NSLog(@"displaying question: %@", question);
    
    //Display the string in the question field
    [self.questionLabel setText:question];
    
    //Clear the answer field
    [self.answerLabel setText:@"???"];
    
}
- (IBAction)showAnswer:(id)sender {
//    [self.answerLabel setText:@"14"];
    
    //What is the answer to the current question?
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];
    
    //Display it in the answer field
    [self.answerLabel setText:answer];
}
@end
