//
//  DSSCoordinatesFinder.h
//  CoordinateFinder
//
//  Created by dasmer on 1/21/14.
//  Copyright (c) 2014 Columbia University. All rights reserved.
//

#import "DSSCoordinateFinder.h"

#define CoordinatesFinderDefaultDesiredAccuracy kCLLocationAccuracyBest;
const CGFloat CoordinatesFinderDefaultMinimumHorizontalAccuracy = 500.0f;

@interface DSSCoordinateFinder ()
@property (strong,nonatomic) CLLocationManager *locationManager;
@property (copy) void(^callback)(CLLocation *myLocation, NSError *error);
@property (assign,nonatomic) CGFloat minimumAccuracy;
@end


@implementation DSSCoordinateFinder

- (id) init{
    self = [super init];
    if (self)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    return  self;}


- (void) findLocationWithCompletion:(void (^)(CLLocation *, NSError *))callback{
    CLLocationAccuracy defaultAccuracy = CoordinatesFinderDefaultDesiredAccuracy;
    [self findLocationWithLocationAccuracy:defaultAccuracy minimumHorizontalAccuracy:CoordinatesFinderDefaultMinimumHorizontalAccuracy completion:callback];
}


- (void) findLocationWithLocationAccuracy: (CLLocationAccuracy )desiredAccuracy minimumHorizontalAccuracy: (CGFloat) accuracyRadiusInMeters completion:(void(^)(CLLocation *myLocation, NSError *error))callback{
    self.callback = callback;
    self.locationManager.desiredAccuracy = desiredAccuracy;
    self.minimumAccuracy = accuracyRadiusInMeters;
    [self.locationManager startUpdatingLocation];
}

- (void) requestZipCodeWithCompletion:(void(^)(CLLocation *myLocation, NSError *error))callback{
    self.callback = callback;
    [self.locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *myCurrentLocation = [locations lastObject];
    
    if(myCurrentLocation.horizontalAccuracy <= self.minimumAccuracy) {
        [self.locationManager stopUpdatingLocation];
        self.callback(myCurrentLocation,nil);
        self.callback = ^(CLLocation *myLocation, NSError *error) {};
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    self.callback(nil,error);
}
@end