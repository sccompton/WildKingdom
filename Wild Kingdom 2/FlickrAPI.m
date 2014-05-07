//
//  FlickrAPI.m
//  Wild Kingdom 2
//
//  Created by Apple on 25/01/14.
//  Copyright (c) 2014 Tablified Solutions. All rights reserved.
//

#import "FlickrAPI.h"
#import "FlickrPhoto.h"

#define kFlickrAPIKey @"c1797487e0db779d43ce748a73322649"


@implementation FlickrAPI

+ (NSURLRequest *)SearchRequest:(NSString *)searchTerm
{
    searchTerm = [searchTerm stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlString = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&text=%@&per_page=10&format=json&nojsoncallback=1",kFlickrAPIKey,searchTerm];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    return [NSURLRequest requestWithURL:url];
}

+ (NSURL *)PhotoRequest:(FlickrPhoto *) flickrPhoto
{
    NSString *urlString = [NSString stringWithFormat:@"http://farm%d.staticflickr.com/%d/%lld_%@_m.jpg",flickrPhoto.farm,flickrPhoto.server,flickrPhoto.photoID,flickrPhoto.secret];
    
    return [NSURL URLWithString:urlString];
}

@end
