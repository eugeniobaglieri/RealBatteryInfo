//
//  IOKitPowerSourceInfo.h
//  RealBattery
//
//  Created by Eugenio Baglieri on 28/03/13.
//  Copyright (c) 2013 Eugenio Baglieri. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IORegPowerSourceInfo : NSObject

+ (NSDictionary *) getPowerSourceInfo;

@end
