//
//  ViewController.m
//  CM-DoblesPuntos
//
//  Created by Aleyr on 8/20/15.
//  Copyright (c) 2015 CM. All rights reserved.
//

#import "Start.h"
#import "DataClass.h"
#import "CityCell.h"
#import "Map.h"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    //Initialize arrays
    DataClass *data=[DataClass getInstance];
    data.dataIndex = 0;
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DataClass *data=[DataClass getInstance];
    return data.maCities.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    CityCell *cell = (CityCell *)[tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CityCell" bundle:nil] forCellReuseIdentifier:@"CityCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    }
    //Fill cell with info from arrays
    DataClass *data=[DataClass getInstance];
    cell.cityLbl.text   = data.maCities[indexPath.row];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataClass *data=[DataClass getInstance];
    data.dataIndex = (int)indexPath.row;
    NSLog(@"data.dataIndex = %d",data.dataIndex);
    Map *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Map"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}


@end
