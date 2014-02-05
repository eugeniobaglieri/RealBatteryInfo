//
//  DetailsViewController.m
//  RealBattery
//
//  Created by Eugenio Baglieri on 05/02/14.
//  Copyright (c) 2014 Eugenio Baglieri. All rights reserved.
//

#import "DetailsViewController.h"
#import "TableViewDictionaryDatasource.h"

@interface DetailsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) TableViewDictionaryDatasource *dataSource;

@end

@implementation DetailsViewController

#pragma mark - Initialization

- (id)initWithDetailsForDictionary:(NSDictionary *)dict
{
    self = [super initWithNibName:@"DetailsViewController" bundle:nil];
    if (self) {
        self.dataSource = [[TableViewDictionaryDatasource alloc] initWithDictionary:dict];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.table.dataSource = self.dataSource;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
