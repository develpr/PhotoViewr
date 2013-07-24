//
//  RecentViewedTVC.m
//  Photo Viewr
//
//  Created by Kevin Mitchell on 7/23/13.
//  Copyright (c) 2013 Kevin Mitchell. All rights reserved.
//

#import "RecentViewedTVC.h"
#import "RecentPhotos.h"

@implementation RecentViewedTVC

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecentPhoto";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photos = [[RecentPhotos class] recentPhotos];
}

@end
