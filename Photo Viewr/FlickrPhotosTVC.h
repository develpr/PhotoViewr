//
//  FlickrPhotosTVC.h
//  Photo Viewr
//
//  Created by Kevin Mitchell on 7/21/13.
//  Copyright (c) 2013 Kevin Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhotosTVC : UITableViewController

@property (strong, nonatomic) NSArray *photos; //of NSDictionary

- (NSString *)titleForRow:(NSUInteger)row;
- (NSString *)subtitleForRow:(NSUInteger)row;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; //Abstract

@end
