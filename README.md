CoordinateFinder
================

An Objective C Helper Object to Quickly and Easily Retrieve Coordinate and Location Information

Instructions:
Drag DSSCoordinateFinder.h and DSSCoordinateFinder.m from the CoordinateFinder repo into your project, and import 'DSSCoordinateFinder.h' in the class you need current location information.

The following snippet will print a user latitude and longitude coordinates 

```
      [self.coordinateFinder findLocationWithLocationAccuracy:kCLLocationAccuracyBest minimumHorizontalAccuracy:100.0f completion:^(CLLocation *myLocation, NSError *error) {
        if (!error){
            NSLog(@"Latitude: %f, Longitude %f", myLocation.coordinate.latitude, myLocation.coordinate.longitude);
        }
        else{
            NSLog(@"Error: %@",[error localizedDescription]);
        }
    }];
```

Note: The DSSCoordinateFinder should be a strong property of the class. Otherwise, it will be deallocated from memory before it can return location information.  Be sure to declare it like this (or something similiar):
```
@interface ClassName ()
@property (strong,nonatomic) DSSCoordinateFinder *coordinateFinder;
@end
```


