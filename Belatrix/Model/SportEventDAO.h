//
//  SportEventDAO.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 16/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase, SportEvent;

@interface SportEventDAO : NSObject
- (instancetype)init:(NSString *)db;
- (BOOL)create;
- (BOOL)add:(SportEvent *) sportEvent;
- (NSMutableArray *)read;
@end
