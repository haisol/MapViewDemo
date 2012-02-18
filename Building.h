//
//  Building.h
//  MapViewDemo
//
//  Created by Kevin on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Building : NSObject
{
    int intBuildingID; //the primary Key
    NSString* stringBuildingName; //the building name
    NSString* stringBuildingAcronym; //building accronym
    NSString* stringLongitude; 
    NSString* stringLatitude;
    
}

@property (nonatomic, assign) int intBuildingID;
@property (nonatomic, retain) NSString* stringBuildingName;
@property (nonatomic, retain) NSString* stringBuildingAcronym;
@property (nonatomic, retain) NSString* stringLongitude;
@property (nonatomic, retain) NSString* stringLatitude;

//constructor
-(id) initWithData: (int)bID : (NSString*) bName : (NSString*) bAcronym : (NSString*) longitude : (NSString*) latitude;

@end
