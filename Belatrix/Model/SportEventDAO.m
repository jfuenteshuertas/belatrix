//
//  SportEventDAO.m
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 16/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import "SportEventDAO.h"
#import "SportEvent.h"
#import <FMDatabase.h>
#import <FMResultSet.h>


static NSString * const kSQLCreate = @""
"CREATE TABLE IF NOT EXISTS SportEvent ("
"id INTEGER PRIMARY KEY AUTOINCREMENT, "
"forum TEXT, "
"description TEXT, "
"location TEXT, "
"startEvent DATETIME,"
"endEvent DATETIME,"
"capacity INTEGER,"
"participants INTEGER,"
"nameEvent TEXT"
");";

static NSString * const kSQLSelect = @""
"SELECT "
"*"
"FROM "
"SportEvent;";


static NSString * const kSQLInsert = @""
"INSERT INTO "
"SportEvent (forum, description, location,startEvent, endEvent,capacity,participants,nameEvent) "
"VALUES "
"(?, ?, ?, ?, ?, ? ,?,?);";
@interface SportEventDAO ()

@property (nonatomic) FMDatabase *db;

@end

@implementation SportEventDAO


- (instancetype)init:(NSString *)databaseFilePath {
    self.db= [FMDatabase databaseWithPath: databaseFilePath];
    [self.db open];
    [self create];
    self = [super init];
    return self;
}
- (void)dealloc {
    [self.db close];
}

- (BOOL)create {
    return [self.db executeUpdate:kSQLCreate];
}

- (BOOL) add:(SportEvent *) sportEvent{
    return [self.db executeUpdate:kSQLInsert, sportEvent.forumEvent, sportEvent.descriptionEvent, sportEvent.locationEvent ,sportEvent.datetimeStartEvent,sportEvent.datetimeEndEvent,sportEvent.capacityEvent,sportEvent.numberCompetitorEvent,sportEvent.nameEvent] ;
}

- (NSMutableArray *)read {
    NSMutableArray *sportEvents = [NSMutableArray arrayWithCapacity:0];
    FMResultSet    *results = [self.db executeQuery:kSQLSelect];
    SportEvent * tempSportEvent;
    while ([results next]) {
        tempSportEvent = [SportEvent new];
        tempSportEvent.forumEvent = [results stringForColumnIndex:1];
        tempSportEvent.descriptionEvent = [results stringForColumnIndex:2];
        tempSportEvent.locationEvent = [results stringForColumnIndex:3];
        tempSportEvent.datetimeStartEvent = [results dateForColumnIndex:4];
        tempSportEvent.datetimeEndEvent = [results dateForColumnIndex:5];
        tempSportEvent.capacityEvent = [results intForColumnIndex:6];
        tempSportEvent.numberCompetitorEvent = [results intForColumnIndex:7];
        tempSportEvent.nameEvent = [results stringForColumnIndex:8];
        [sportEvents addObject:tempSportEvent];
    }
    return sportEvents;
}
@end
