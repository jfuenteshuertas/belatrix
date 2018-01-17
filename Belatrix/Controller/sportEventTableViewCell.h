//
//  sportEventTableViewCell.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 13/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sportEventTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *eventNameUILabel;
@property (weak, nonatomic) IBOutlet UILabel *locationEventUILabel;
@property (weak, nonatomic) IBOutlet UILabel *numberCompetitorUILabel;
@property (weak, nonatomic) IBOutlet UILabel *scheduleEventUILabel;
@property (weak, nonatomic) IBOutlet UIView *contentUIView;

@end
