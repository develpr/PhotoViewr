//
//  RecentPhotos.h
//  Photo Viewr
//
//  Created by Kevin Mitchell on 7/23/13.
//  Copyright (c) 2013 Kevin Mitchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentPhotos : NSObject

+ (NSArray *) recentPhotos;
+ (void) addPhoto:(NSDictionary *)photo;

@end
