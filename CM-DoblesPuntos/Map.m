//
//  Map.m
//  CM-DoblesPuntos
//
//  Created by Aleyr on 8/20/15.
//  Copyright (c) 2015 CM. All rights reserved.
//

#import "Map.h"
#import "Start.h"
#import "DataClass.h"
@import CoreLocation;

#define         nLocalizing     0
#define         nLocalized      1

//Localization
double                   mlatitude;
double                   mlongitude;
static int              iLocalizeState = nLocalized;

@interface Map ()

@end

@implementation Map {
    GMSMarker           *markerLocation;
    GMSCameraPosition   *camera;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Location
    self.locationManager                    = [[CLLocationManager alloc] init];
    self.locationManager.delegate           = self;
    self.location                           = [[CLLocation alloc] init];
    self.locationManager.desiredAccuracy    = kCLLocationAccuracyBest;
    
    [self.locationManager  requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    NSLog(@"---**/mlatitude = %@",[DataClass getInstance].maLatitudes[[DataClass getInstance].dataIndex]);
    NSLog(@"---**/mlongitude = %@",[DataClass getInstance].maLongitudes[[DataClass getInstance].dataIndex]);
    if ([DataClass getInstance].dataIndex > 0) {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        
        mlatitude = [numberFormatter numberFromString:(NSString *)[DataClass getInstance].maLatitudes[[DataClass getInstance].dataIndex]].doubleValue;
        NSLog(@"---**/mlatitude = %f",mlatitude);
        mlongitude = [numberFormatter numberFromString:(NSString *)[DataClass getInstance].maLongitudes[[DataClass getInstance].dataIndex]].doubleValue;
        NSLog(@"---**/mlongitude = %f",mlongitude);

    } else {
        // UAG location by default
        mlatitude = 20.703575;
        mlongitude = -103.417559;
    }
    [self paintMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"CM-DoblesPuntos:Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.locationManager stopUpdatingLocation];
}
*/
/**********************************************************************************************/
#pragma mark - Maps methods
/**********************************************************************************************/

- (void) setPosition:(float) lat withLongitude:(float) lon {
    mlatitude = lat;
    mlongitude = lon;
}

- (void) startLocalization {
    iLocalizeState = nLocalizing;
}

- (void) stopLocalization {
    iLocalizeState = nLocalized;
}

- (void) paintMap {
    NSLog(@"---**/paintMap");
    [self.mapView removeFromSuperview];
    camera                           = [GMSCameraPosition cameraWithLatitude:mlatitude longitude:mlongitude zoom:16];
    self.mapView                     = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.frame               = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
    self.mapView.myLocationEnabled   = YES;
    
    [self.view addSubview:self.mapView];
}


- (void) paintMarker {
    GMSMarker *marker       = [[GMSMarker alloc] init];
    marker.position         = camera.target;
    marker.title            = @"UAG";
    marker.snippet          = @"Clase de Maestría";
    marker.appearAnimation  = kGMSMarkerAnimationPop;
    marker.map = self.mapView;
    
    /*
     CLLocationCoordinate2D position;
     NSLog(@"maPlacesTitle.count %d", (int)maPlacesTitle.count);
     for (int i = 0; i<maPlacesTitle.count; i++)
     {
     CGFloat lat                     = (CGFloat)[maPlacesLat[i] floatValue];
     CGFloat lng                     = (CGFloat)[maPlacesLng[i] floatValue];
     NSLog(@"Marker lat %f, long %f", lat, lng);
     position                        = CLLocationCoordinate2DMake(lat, lng);
     markerLocation                  = [GMSMarker markerWithPosition:position];
     markerLocation.icon             = [GMSMarker markerImageWithColor:[UIColor greenColor]];
     markerLocation.title            = maPlacesTitle[i];
     markerLocation.snippet          = maPlacesSnippet[i];
     markerLocation.appearAnimation  = kGMSMarkerAnimationPop;
     markerLocation.map              = mapView;
     }
     */
}

/**********************************************************************************************/
#pragma mark - Localization
/**********************************************************************************************/
/*
 - (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
 self.location = locations.lastObject;
 NSLog(@"didUpdateLocation!");
 CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
 [geoCoder reverseGeocodeLocation:self.locationManager.location completionHandler:^(NSArray *placemarks, NSError *error) {
 for (CLPlacemark *placemark in placemarks) {
 NSString *addressName = [placemark name];
 NSString *city = [placemark locality];
 NSString *administrativeArea = [placemark administrativeArea];
 NSString *country  = [placemark country];
 NSString *countryCode = [placemark ISOcountryCode];
 NSLog(@"name is %@ and locality is %@ and administrative area is %@ and country is %@ and country code %@", addressName, city, administrativeArea, country, countryCode);
 }
 
 //mlatitude = self.locationManager.location.coordinate.latitude;
 //mlongitude = self.locationManager.location.coordinate.longitude;
 //NSLog(@"mlatitude = %f", mlatitude);
 //NSLog(@"mlongitude = %f", mlongitude);
 if (iLocalizeState == nLocalizing) {
 [self paintMap];
 [self paintMarker];
 iLocalizeState = nLocalized;
 }
 }];
 
 }
 */

- (IBAction)backBtn:(id)sender {
    [self.mapView removeFromSuperview];
    Start *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Start"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
