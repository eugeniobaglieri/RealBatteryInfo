//
//  TableViewArrayDatasource.m
//  RealBattery
//
//  Created by Eugenio Baglieri on 04/02/14.
//  Copyright (c) 2014 Eugenio Baglieri. All rights reserved.
//

#import "TableViewDictionaryDatasource.h"

@interface TableViewDictionaryDatasource ()

@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) NSArray *dictionaryKeys;

@end

@implementation TableViewDictionaryDatasource

#pragma mark - Initialization

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.dictionary = dict;
        self.dictionaryKeys = [[dict allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    return self;
}

#pragma mark - Public methods

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = [self.dictionaryKeys objectAtIndex:indexPath.row];
    return [self.dictionary objectForKey:key];
}

- (NSString *)keyAtIndexPth:(NSIndexPath *)indexPth
{
    return [self.dictionaryKeys objectAtIndex:indexPth.row];
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dictionary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];

    NSString *key = [self.dictionaryKeys objectAtIndex:indexPath.row];
    id obj = [self.dictionary objectForKey:key];
    
    if ([obj isKindOfClass:[NSDictionary class]] )
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.textLabel.text = key;
        cell.detailTextLabel.text = nil;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = key;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",obj];
    }
    
    return cell;
}

@end
