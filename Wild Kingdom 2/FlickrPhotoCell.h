//
//  FlickrPhotoCell.h
//  Wild Kingdom 2
//
//  Created by Apple on 25/01/14.
//  Copyright (c) 2014 Tablified Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlickrPhoto;
@interface FlickrPhotoCell : UICollectionViewCell

@property (nonatomic, strong) FlickrPhoto *photo;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;


@end
