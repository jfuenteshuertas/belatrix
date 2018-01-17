//
//  Function.m
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 16/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import "Function.h"

@implementation Function
+ (NSDate*) convertNStringToNSDate:(NSString*) dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    return dateFromString;
}
+ (NSString*) convertNSDateToNSString:(NSDate*)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE dd LLLL yyyy"];
    return [dateFormatter stringFromDate:date];
}
+ (NSString*) getHourFromDate:(NSDate*) date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *timeString = [formatter stringFromDate:date];
    return timeString;
}
+ (NSMutableArray*) orderNSMutuableArrayByDate:(NSMutableArray* )arrayUnsorted{
    NSSortDescriptor* sortByDate = [NSSortDescriptor sortDescriptorWithKey:@"datetimeStartEvent" ascending:YES];
    [arrayUnsorted sortUsingDescriptors:[NSArray arrayWithObject:sortByDate]];
    return arrayUnsorted;
}
+ (NSString*) getFullNameDayFromNSDate:(NSDate*)date{
    NSString* nameDayString= @"No especificado";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE dd LLLL yyyy"];    
    if([[NSCalendar currentCalendar] isDateInToday:date])nameDayString=@"Today";
    else if([[NSCalendar currentCalendar] isDateInTomorrow:date])nameDayString=@"Tomorrow";
    else if([[NSCalendar currentCalendar] isDateInYesterday:date])nameDayString=@"Yesterday";
    else if(date != nil) nameDayString = [dateFormatter stringFromDate:date];
    return nameDayString;
}
+ (void) setBorderUITextField:(UITextField *)texfield{
    texfield.layer.cornerRadius = 15.0;
    texfield.layer.masksToBounds = YES;
    texfield.layer.borderWidth = 1.0;
    
    texfield.layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor];
    [texfield.layer setShadowColor: [[UIColor grayColor] CGColor]];
    [texfield.layer setShadowOpacity:1];
    [texfield.layer setShadowOffset: CGSizeMake(2.0, 2.0)];
}
+ (NSString *)databaseFilePath {
    NSArray*  paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString* dir   = [paths objectAtIndex:0];
    return [dir stringByAppendingPathComponent:@"sportEvents.db"];
}
@end
