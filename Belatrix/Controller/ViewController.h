//
//  ViewController.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 13/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *sportEventUITableView;
@property (nonatomic) NSMutableArray* listSportEvent;
@end

