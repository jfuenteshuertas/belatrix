//
//  AppDelegate.h
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 13/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SportEvent.h"
#import "Function.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

