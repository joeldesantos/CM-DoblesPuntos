//
//  Map.h
//  CM-DoblesPuntos
//
//  Created by Aleyr on 8/20/15.
//  Copyright (c) 2015 CM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Google/Analytics.h>
@import GoogleMaps;

@interface Map : UIViewController<CLLocationManagerDelegate>

@property (strong, nonatomic)   CLLocationManager   *locationManager;
@property (strong, nonatomic)   CLLocation          *location;

@property (strong, nonatomic) IBOutlet UINavigationItem *titleLbl;

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;


- (void) setPosition:(float) lat withLongitude:(float) lon;
- (void) startLocalization;
- (void) stopLocalization;
- (void) paintMap;

@end
