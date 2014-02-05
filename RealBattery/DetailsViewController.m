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
@property (strong, nonatomic) TableViewDictionaryDatasource *datasource;

@end

@implementation DetailsViewController

#pragma mark - Initialization

- (id)initWithDetailsForDictionary:(NSDictionary *)dict
{
    self = [super initWithNibName:@"DetailsViewController" bundle:nil];
    if (self) {
        self.datasource = [[TableViewDictionaryDatasource alloc] initWithDictionary:dict];
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
    self.table.dataSource = self.datasource;
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
