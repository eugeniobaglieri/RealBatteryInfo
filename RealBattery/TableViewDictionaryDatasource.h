//
//  TableViewArrayDatasource.h
//  RealBattery
//
//  Created by Eugenio Baglieri on 04/02/14.
//  Copyright (c) 2014 Eugenio Baglieri. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const cellIdentifier = @"Cell";

@interface TableViewDictionaryDatasource : NSObject <UITableViewDataSource>

- (id)initWithDictionary:(NSDictionary *)dict;
- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

@end
