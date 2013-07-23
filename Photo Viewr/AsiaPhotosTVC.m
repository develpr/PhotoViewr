//
//  AsiaPhotosTVC.m
//  Photo Viewr
//
//  Created by Kevin Mitchell on 7/21/13.
//  Copyright (c) 2013 Kevin Mitchell. All rights reserved.
//

#import "AsiaPhotosTVC.h"
#import "FlickrFetcher.h"

@interface AsiaPhotosTVC ()

@end

@implementation AsiaPhotosTVC

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SetPhoto";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self titleForRow:indexPath.row];
    cell.detailTextLabel.text = [self subtitleForRow:indexPath.row];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photos = [FlickrFetcher asiaBlackAndWhitePhotos];
}

@end
