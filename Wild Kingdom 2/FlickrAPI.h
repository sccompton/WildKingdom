//
//  FlickrAPI.h
//  Wild Kingdom 2
//
//  Created by Apple on 25/01/14.
//  Copyright (c) 2014 Tablified Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FlickrPhoto;
@interface FlickrAPI : NSObject

+ (NSURLRequest *)SearchRequest:(NSString *)searchTerm;
+ (NSURL *)PhotoRequest:(FlickrPhoto *) flickrPhoto;

@end
