//
//  ViewController.m
//  RealBattery
//
//  Created by Eugenio Baglieri on 28/03/13.
//  Copyright (c) 2013 Eugenio Baglieri. All rights reserved.
//

#import "MainViewController.h"
#import "IORegPowerSourceInfo.h"
#import "TableViewDictionaryDatasource.h"
#import "DetailsViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSDictionary* powerSourceInfo;
@property (strong, nonatomic) TableViewDictionaryDatasource *dataSource;

- (IBAction)refreshData:(id)sender;

@end

@implementation MainViewController

#pragma mark - Initialization

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.powerSourceInfo = [IORegPowerSourceInfo getPowerSourceInfo];
    self.dataSource = [[TableViewDictionaryDatasource alloc] initWithDictionary:self.powerSourceInfo];
    self.table.dataSource = self.dataSource;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)refreshData:(id)sender {
    self.powerSourceInfo = [IORegPowerSourceInfo getPowerSourceInfo];
    [_table reloadData];
}

#pragma mark - UITableView's delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id obj = [self.dataSource objectAtIndexPath:indexPath];
    if (![obj isKindOfClass:[NSDictionary class]]) {
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailsViewController *detailsViewController = [[DetailsViewController alloc] initWithDetailsForDictionary:obj];
    detailsViewController.title = [self.dataSource keyAtIndexPth:indexPath];
    [self.navigationController pushViewController:detailsViewController animated:YES];
}
@end

