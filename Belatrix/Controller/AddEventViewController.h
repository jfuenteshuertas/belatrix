//
//  AddEventViewController.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 14/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *eventNameUITextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *startEventDaterPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endEventDaterPicker;
@property (weak, nonatomic) IBOutlet UITextField *forumEventUITextField;
@property (weak, nonatomic) IBOutlet UITextField *locationEventUITextField;
@property (weak, nonatomic) IBOutlet UISwitch *publicUISwitch;
@property (weak, nonatomic) IBOutlet UITextView *descriptionUITextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewAddEvent;

- (IBAction)cancelIBAction:(id)sender;
- (IBAction)saveIBAction:(id)sender;
@end
