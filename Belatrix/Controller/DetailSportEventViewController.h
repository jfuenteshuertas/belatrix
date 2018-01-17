//
//  DetailSportEventViewController.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 16/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SportEvent.h"
@interface DetailSportEventViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageSportEventUIImageView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionSportEventUIText;
@property (weak, nonatomic) IBOutlet UITextField *startSportEventUITextField;
@property (weak, nonatomic) IBOutlet UITextField *endSportEventUITextField;
@property (weak, nonatomic) IBOutlet UITextField *locationSportEventUITextField;
@property (weak, nonatomic) IBOutlet UILabel *participantSportEventUILabel;
@property (nonatomic) SportEvent* sportEvent;
@end
