//
//  FlickrPhotoCell.m
//  Wild Kingdom 2
//
//  Created by Apple on 25/01/14.
//  Copyright (c) 2014 Tablified Solutions. All rights reserved.
//

#import "FlickrPhotoCell.h"
#import "FlickrPhoto.h"

@implementation FlickrPhotoCell

-(void) setPhoto:(FlickrPhoto *)flickrPhoto {
    _photo = flickrPhoto;
    _myImageView.image = _photo.flickrImage;
}

@end
