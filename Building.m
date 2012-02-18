//
//  Building.m
//  MapViewDemo
//
//  Created by Kevin on 2/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Building.h"

@implementation Building
@synthesize intBuildingID, stringBuildingAcronym, stringBuildingName, stringLatitude, stringLongitude;

//constructor
-(id) initWithData: (int)bID : (NSString*) bName : (NSString*) bAcronym : (NSString*) longitude : (NSString*) latitude
{
    intBuildingID = bID;
    stringBuildingName = bName;
    stringBuildingAcronym = bAcronym;
    stringLatitude = latitude;
    stringLongitude = longitude;
    return self;
    
}
@end
