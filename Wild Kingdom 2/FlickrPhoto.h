//
//  FlickrPhoto.h
//  Wild Kingdom 2
//
//  Created by Apple on 25/01/14.
//  Copyright (c) 2014 Tablified Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPhoto : NSObject

@property(nonatomic,strong) UIImage *flickrImage;
@property(nonatomic) long long photoID;
@property(nonatomic) NSInteger farm;
@property(nonatomic) NSInteger server;
@property(nonatomic,strong) NSString *secret;

@end
