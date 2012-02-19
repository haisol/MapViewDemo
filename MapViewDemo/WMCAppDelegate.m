//
//  WMCAppDelegate.m
//  MapViewDemo
//
//  Created by Kevin on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WMCAppDelegate.h"
#import "Building.h"
@implementation WMCAppDelegate

@synthesize window = _window;
@synthesize aryDatabase;

//updates the name and path for the database.
-(void)updateNames{
    databaseName = @"WheresMyClass.sqlite";
    NSArray* documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDir = [documentsPath objectAtIndex:0];
    databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
}

//checks if db  was found and if not copies it from the resources dir.
-(void)checkAndCreateDatabase{
    BOOL success;
    NSFileManager* fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:databasePath];
    
    if(success)
    {
        return;
    }
    NSString* databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:databaseName];
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
}


-(void) saveDatabase{

}

//loop through database object and push it into an array.
-(void)readWordsFromDatabase{
    db = [FMDatabase databaseWithPath:databasePath];
    aryDatabase = [[NSMutableArray alloc] init];
    [db setLogsErrors:true];
    [db setTraceExecution:true];
    if(![db open])
    {
        NSLog(@"Failed to open database");
        return;
    }
    else
    {
        NSLog(@"Openned database successfully");
    }
    
    
     //NSString *queryString = @"insert into building select null, 'Testing', 'test', '12', '20';"; 
    
    [db beginTransaction];
    
    [db executeUpdate:@"insert into building select null, 'Testing4', 'test4', '12', '20';"];
    NSLog(@"Add DB item: %@", @"Testing");
    //NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    
    [db commit];
    //[db close];
    
    
    FMResultSet* rs = [db executeQuery: @"select * from Building"];
    while([rs next])
    {
        int tmpID = [rs intForColumn:@"Building_ID"];
        NSString* tmpName = [rs stringForColumn:@"Name"];
        NSString* tmpAcr    = [rs stringForColumn:@"Acronym"];
        NSString* tmpLong = [rs stringForColumn:@"Longitude"];
        NSString* tmpLat = [rs stringForColumn:@"Latitude"];
        Building* tmpBuilding = [[Building alloc] initWithData:tmpID :tmpName :tmpAcr :tmpLong :tmpLat];
        [aryDatabase addObject:tmpBuilding];
        NSLog(@"Get DB item: %@", tmpName);
    }
    [db close];
    [db closeOpenResultSets];
    //NSLog(@"DBPath: %@", databasePath);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"entering App did finish lonch");
    [self updateNames];
    [self checkAndCreateDatabase];
    [self readWordsFromDatabase];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
