//
//  DSSCoordinateFinder.h
//  CoordinateFinder
//
//  Created by dasmer on 1/21/14.
//  Copyright (c) 2014 Columbia University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface DSSCoordinateFinder : NSObject <CLLocationManagerDelegate>

- (void) findLocationWithLocationAccuracy: (CLLocationAccuracy )desiredAccuracy minimumHorizontalAccuracy: (CGFloat) accuracyRadiusInMeters completion:(void(^)(CLLocation *myLocation, NSError *error))callback;

//desiredAccuracy and accuracyRadiusInMeters are the defaults set in the .m file
- (void) findLocationWithCompletion:(void(^)(CLLocation *myLocation, NSError *error))callback;

@end
