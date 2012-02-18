//
//  WMCAppDelegate.h
//  MapViewDemo
//
//  Created by Kevin on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@interface WMCAppDelegate : UIResponder <UIApplicationDelegate>{
    NSMutableArray *aryDatabase;
    NSString* databaseName;
    NSString* databasePath;
    FMDatabase* db;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableArray* aryDatabase;

@end
