Although the textbook says to put the initialization code in initWithNibName:bundle:, this method isn't actually 
called by the AppDelegate for whatever reason. I know this because the NSLog() statements do not log anything to the 
console.  Instead, I put the initialization code in its own method called createAndSetQuestionsAndAnswers (for ease 
of access) and decided to call it from viewDidLoad, which apparently is called at startup.