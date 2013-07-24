//
//  RecentPhotos.m
//  Photo Viewr
//
//  Created by Kevin Mitchell on 7/23/13.
//  Copyright (c) 2013 Kevin Mitchell. All rights reserved.
//

#import "RecentPhotos.h"


@implementation RecentPhotos

+ (void)addPhoto:(NSDictionary *)photo
{
    NSMutableArray *photos = [[[self class]recentPhotos] mutableCopy];
    
    [photos addObject:photo];
    
    [[NSUserDefaults standardUserDefaults] setObject:photos forKey:@"RecentPhotos"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSArray *)recentPhotos
{
    NSArray *photos = [[NSUserDefaults standardUserDefaults] objectForKey:@"RecentPhotos"];
    
    if(!photos)
        photos = [[NSArray alloc]init];
        
    return photos;
}

@end
