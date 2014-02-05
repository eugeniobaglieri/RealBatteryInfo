//
//  IOKitPowerSourceInfo.m
//  RealBattery
//
//  Created by Eugenio Baglieri on 28/03/13.
//  Copyright (c) 2013 Eugenio Baglieri. All rights reserved.
//

#import "IORegPowerSourceInfo.h"
#import "IOPowerSources.h"
#import "IOPSKeys.h"
#import "IOKitLib.h"

@implementation IORegPowerSourceInfo

+ (NSDictionary *) getPowerSourceInfo {
    io_object_t deviceHandle;
    kern_return_t kernReturn;
    CFMutableDictionaryRef serviceMatch, properties;
    NSDictionary *psi = nil;
    
    serviceMatch = IOServiceMatching("IOPMPowerSource");
    deviceHandle = IOServiceGetMatchingService(kIOMasterPortDefault, serviceMatch);
    kernReturn = IORegistryEntryCreateCFProperties(deviceHandle, &properties, NULL, 0);
    if(kernReturn == kIOReturnSuccess) {
        psi = [NSDictionary dictionaryWithDictionary:
               (__bridge NSDictionary*)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFDictionaryRef)properties, 0)];
    }
    CFRelease(properties);
    IOObjectRelease(deviceHandle);
    NSLog(@"%@",psi);
    return psi;
}

@end
