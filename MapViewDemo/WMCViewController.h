//
//  WMCViewController.h
//  MapViewDemo
//
//  Created by Kevin on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WMCViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    
    __weak IBOutlet MKMapView *mapView;
    __weak IBOutlet UISegmentedControl *mySegmentControl;
     
    CLLocationManager *myLocationManager; //used for updating the movment of my ocation
    CLLocationCoordinate2D myLocationCoordinate; //used for storing 2d location cordinates.
    
    __weak IBOutlet UIBarButtonItem *mySS441Button;
    
    
    __weak IBOutlet UIBarButtonItem *myLibraryButton;
    
    bool myDefaultSetLocation; //used to identify if the default set location has been set.
    
}

@property (nonatomic, retain) CLLocationManager *myLocationManager; 
@property (nonatomic, readonly) CLLocationCoordinate2D myLocationCoordinate; 

@property (nonatomic, assign) bool myDefaultSetLocation; 



@end
