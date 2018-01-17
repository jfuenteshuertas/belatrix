//
//  AddEventViewController.m
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 14/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import "AddEventViewController.h"
#import "Function.h"
#import "SportEvent.h"
#import "SportEventDAO.h"
@interface AddEventViewController (){
    SportEventDAO* sportEventDAO;
}
@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    sportEventDAO = [[SportEventDAO alloc]init:[Function databaseFilePath]];
}
- (void) viewDidLayoutSubviews{
    [Function setBorderUITextField:_eventNameUITextField];
    [Function setBorderUITextField:_forumEventUITextField];
    [Function setBorderUITextField:_locationEventUITextField];
    _descriptionUITextView.layer.borderWidth = 1.0f;
    _descriptionUITextView.layer.cornerRadius = 5.0f;
    _descriptionUITextView.layer.borderColor = [[UIColor blackColor] CGColor];
    NSDate *currentDate = [NSDate date];
    _startEventDaterPicker.minimumDate= currentDate;
    _endEventDaterPicker.minimumDate = currentDate;
    [_startEventDaterPicker addTarget:self action:@selector(dateIsChanged:) forControlEvents:UIControlEventValueChanged];
}
#pragma mark - Keyboard
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardWasShown:(NSNotification*)aNotification{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [_scrollViewAddEvent setContentOffset:CGPointMake(0, kbSize.height) animated:YES];
}
//called when the text field is being edited
- (IBAction)textFieldDidBeginEditing:(UITextField *)sender {
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - IBAction
- (IBAction)cancelIBAction:(id)sender {
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveIBAction:(id)sender {
    if(![self verifyDataEvent]) return;
    SportEvent* newSportEvent = [SportEvent new];
    newSportEvent.forumEvent = _forumEventUITextField.text;
    newSportEvent.descriptionEvent = _descriptionUITextView.text;
    newSportEvent.datetimeStartEvent = _startEventDaterPicker.date;
    newSportEvent.datetimeEndEvent = _endEventDaterPicker.date;
    newSportEvent.locationEvent = _locationEventUITextField.text;
    newSportEvent.publicEvent = _publicUISwitch.on;
    newSportEvent.nameEvent = _eventNameUITextField.text;
    [sportEventDAO add:newSportEvent];
    [self.view.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - IBAction

- (BOOL) verifyDataEvent{
    [self textFieldShouldReturn:nil];
    NSString* nameEvent = [_descriptionUITextView.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    if(nameEvent.length == 0){
        _eventNameUITextField.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    NSString* description = [_descriptionUITextView.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    if(description.length == 0 || [description isEqual:@"Description"]){
        _descriptionUITextView.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    NSString* forum = [_forumEventUITextField.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    if(forum.length == 0){
        _forumEventUITextField.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    return true;
}
- (void)dateIsChanged:(id)sender{
    NSDate *datePciker =_startEventDaterPicker.date;
    _endEventDaterPicker.minimumDate=datePciker;
}
@end
