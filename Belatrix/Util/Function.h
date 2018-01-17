//
//  Function.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 16/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Function : NSObject
+ (NSDate*) convertNStringToNSDate:(NSString*) dateString;
+ (NSString*) getHourFromDate:(NSDate*) date;
+ (NSMutableArray*) orderNSMutuableArrayByDate:(NSMutableArray* )arrayUnsorted;
+ (NSString*) getFullNameDayFromNSDate:(NSDate*)date;
+ (NSString*) convertNSDateToNSString:(NSDate*)date;
+ (void) setBorderUITextField:(UITextField *)texfield;
+ (NSString *)databaseFilePath;
@end
