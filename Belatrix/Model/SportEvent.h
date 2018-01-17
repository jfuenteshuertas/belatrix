//
//  SportEvent.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 14/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SportEvent : NSObject
@property (nonatomic) NSString *nameEvent;
@property (nonatomic) NSString *locationEvent;
@property (nonatomic) NSDate *datetimeStartEvent;
@property (nonatomic) NSDate *datetimeEndEvent;
@property (nonatomic) NSInteger capacityEvent;
@property (nonatomic) NSInteger numberCompetitorEvent;
@property (nonatomic) NSString *descriptionEvent;
@property (nonatomic) NSString* forumEvent;
@property (nonatomic) BOOL publicEvent;
@end
