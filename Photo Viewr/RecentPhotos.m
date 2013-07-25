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
    
    
    NSString *newId = [photo valueForKey:@"id"];
    
    NSArray *photosCopy = [photos copy];
    
    //See if the existing photo ID already exists in the photos and remove if so
    for(NSDictionary *aPhoto in photosCopy){
        if([newId isEqualToString:[aPhoto valueForKey:@"id"]]){
            [photos removeObject:aPhoto];
            //We only should ever have a single copy. See: some proof I should have learned in algorythms
            break;
        }
    }

    [photos insertObject:photo atIndex:0];
    
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
