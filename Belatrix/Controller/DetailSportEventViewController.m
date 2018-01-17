//
//  DetailSportEventViewController.m
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 16/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import "DetailSportEventViewController.h"
#import "Function.h"
@interface DetailSportEventViewController ()

@end

@implementation DetailSportEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setSportEvent];
}
- (void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [Function setBorderUITextField:_startSportEventUITextField];
    [Function setBorderUITextField:_endSportEventUITextField];
    [Function setBorderUITextField:_locationSportEventUITextField];
    _descriptionSportEventUIText.layer.borderWidth = 1.0f;
    _descriptionSportEventUIText.layer.cornerRadius = 5.0f;
    _descriptionSportEventUIText.layer.borderColor = [[UIColor blackColor] CGColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Own methods
- (void) setSportEvent{
    if(_sportEvent!=nil){
        _descriptionSportEventUIText.text=_sportEvent.descriptionEvent;
        _startSportEventUITextField.text = [Function convertNSDateToNSString:_sportEvent.datetimeStartEvent];
        _endSportEventUITextField.text = [Function convertNSDateToNSString:_sportEvent.datetimeEndEvent];
        _participantSportEventUILabel.text = [NSString stringWithFormat:@"%d",(int)_sportEvent.capacityEvent];
        _locationSportEventUITextField.text = _sportEvent.locationEvent;
    }
}
@end
