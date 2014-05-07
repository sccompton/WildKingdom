//
//  ViewController.m
//  Wild Kingdom 2
//
//  Created by Apple on 24/01/14.
//  Copyright (c) 2014 Tablified Solutions. All rights reserved.
//

#import "ViewController.h"
#import "FlickrAPI.h"
#import "FlickrPhoto.h"
#import "FlickrPhotoCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSString * urlString;
    NSDictionary *photosDictionary;
    NSArray *photoDetailArray;
    NSMutableArray *photoArray;
    __weak IBOutlet UICollectionView *myCollectionView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURLRequest *request = [FlickrAPI SearchRequest:self.searchTerm];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        photosDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        photoDetailArray = photosDictionary[@"photos"][@"photo"];
        photoArray = [NSMutableArray new];
        
        for (int i = 0; i < photoDetailArray.count; i++)
        {
            FlickrPhoto *flickrPhoto = [[FlickrPhoto alloc] init];
            flickrPhoto.farm = [photoDetailArray[i][@"farm"] intValue];
            flickrPhoto.server = [photoDetailArray[i][@"server"] intValue];
            flickrPhoto.secret = photoDetailArray[i][@"secret"];
            flickrPhoto.photoID = [photoDetailArray[i][@"id"] longLongValue];
            
            NSURL *url = [FlickrAPI PhotoRequest:flickrPhoto];
            
            NSData *imageData = [NSData dataWithContentsOfURL:url options:0 error:nil];
            flickrPhoto.flickrImage = [UIImage imageWithData:imageData];
            
            [photoArray addObject:flickrPhoto];
        }
        [myCollectionView reloadData];
    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return photoArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlickrPhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCellID" forIndexPath:indexPath];
    cell.photo = photoArray[indexPath.row];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionViewLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        return CGSizeMake(320.0, 240.0);
    } else {
        return CGSizeMake(140.0, 140.0);
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if ((toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)) {
        [self prefersStatusBarHidden];
        UICollectionViewFlowLayout *landscape = [UICollectionViewFlowLayout new];
        landscape.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        myCollectionView.collectionViewLayout = landscape;
    }
    if ((toInterfaceOrientation == UIInterfaceOrientationPortrait) || (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)) {
        UICollectionViewFlowLayout *portrait = [UICollectionViewFlowLayout new];
        portrait.scrollDirection = UICollectionViewScrollDirectionVertical;
        myCollectionView.collectionViewLayout = portrait;
    }
}

@end
