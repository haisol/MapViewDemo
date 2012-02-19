//
//  WMCViewController.m
//  MapViewDemo
//
//  Created by Kevin on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WMCViewController.h"

@implementation WMCViewController
@synthesize myLocationManager, myLocationCoordinate, myDefaultSetLocation;






- (IBAction)myLibraryButton:(id)sender {
    NSLog(@"Library button clicked");
    //46.859358,-113.982989
    
    myLocationCoordinate.latitude = 46.859358;
    myLocationCoordinate.longitude = -113.982989;
    
    //location updated so center to that location.
    MKCoordinateRegion myRegion;
    //only set the default location one time.
    
    
    MKCoordinateSpan mySpan;
    mySpan.latitudeDelta = 0.002;
    mySpan.longitudeDelta = 0.002;
    
    //set how zoomed in we are.
    
    myRegion.span = mySpan;
    
    
    myRegion.center = myLocationCoordinate;
    [mapView setRegion:myRegion animated:true];  
    
    

}


- (IBAction)mySS441Button:(id)sender {
    
    NSLog(@"SS441 button clicked");
    
    //+46° 51' 42.67", -113° 59' 6.68" //ss building
    //46.861853, -113.985188
    myLocationCoordinate.latitude = 46.861853;
    myLocationCoordinate.longitude = -113.985188;

    //location updated so center to that location.
    MKCoordinateRegion myRegion;
    //only set the default location one time.
    
    myRegion.center = myLocationCoordinate;
    [mapView setRegion:myRegion animated:true];  
}





- (IBAction)segmentedChanged:(id)sender {
    if(mySegmentControl.selectedSegmentIndex == 0){
        mapView.mapType = MKMapTypeStandard;
            }
    if(mySegmentControl.selectedSegmentIndex == 1){
        mapView.mapType = MKMapTypeSatellite;
        
    }
    if(mySegmentControl.selectedSegmentIndex == 2){
        mapView.mapType = MKMapTypeHybrid;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //mapview setup
    [self.view insertSubview:mapView atIndex:0];
    mapView.showsUserLocation = true;
    mapView.delegate = self;
    mapView.zoomEnabled = true;
    mapView.scrollEnabled = true;
    mapView.userInteractionEnabled = true;
    
    //location manager setup
    self.myLocationManager = [[CLLocationManager alloc] init];
    myLocationManager.delegate = self;
    myLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    
    myDefaultSetLocation = false;
    
    [myLocationManager startUpdatingLocation];
    [myLocationManager startUpdatingHeading];
    
    
    
}

//fires when you move arround to update your location
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //NSLog(@"locatioin updating");
    myLocationCoordinate = newLocation.coordinate;
    
    //location updated so center to that location.
    MKCoordinateRegion myRegion;
    //only set the default location one time.
   
    myRegion.center = myLocationCoordinate;
        
    
    
    //set zoom level to span
    MKCoordinateSpan mySpan;
    mySpan.latitudeDelta = 0.003;
    mySpan.longitudeDelta = 0.003;
    
    //set how zoomed in we are.
    
    myRegion.span = mySpan;
    if(!myDefaultSetLocation)
    {
        [mapView setRegion:myRegion animated:true];
    }
}


//used to make a pin marker for the current location.
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSLog(@"Annotation view run");
    
    MKPinAnnotationView *myAnnView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier: @"currentloc"];
    myDefaultSetLocation = true;
    
    return myAnnView;
    
}


//if the heading has changed, this function can change the directional location to the new heading.
- (void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"Did update Heading accuracy %f", newHeading.headingAccuracy);
    if(newHeading.headingAccuracy > 0)
    {
        myDefaultSetLocation = true;
        //set the transformation of the image to the correct transformation
        //http://www.youtube.com/watch?feature=endscreen&v=WjCjxEkKrDs&NR=1
    }
}


- (void)viewDidUnload
{
    mySegmentControl = nil;
    mapView = nil;
    myLocationManager = nil;

    mySS441Button = nil;
    myLibraryButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
