//
//  FirstViewController.m
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 13/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import "FirstViewController.h"
#import "ImgurImage.h"
#import "PPJCollectionViewCell.h"
#import <JBSpacer.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JBSpacerOption *option = [JBSpacerOption optionWithItemSize:90.0f
                                                  minimumGutter:1.0f
                                            gutterToMarginRatio:1.0f
                                                  availableSize:320.0f //self.view.frame.size.width
                                       distributeExtraToMargins:YES];
    JBSpacer *spacer = [JBSpacer spacerWithOption:option];
    [spacer applySpacingToCollectionViewFlowLayout:self.flowLayout];
    
    [self.collectionView.collectionViewLayout invalidateLayout];
    [ImgurGallery sharedGallery].delegate = self;
    [[ImgurGallery sharedGallery] refreshGallery];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ImgurGalleryDelegate

- (void) imgurDidLoadNewJSON
{
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray * arr = [[ImgurGallery sharedGallery] gallery][@"data"];
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"MyCell";
    PPJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    NSArray * arr = [[ImgurGallery sharedGallery] gallery][@"data"];

    NSURL * url = [ImgurImage imageURLFromId:arr[indexPath.row][@"id"] withType:arr[indexPath.row][@"type"] andIsAlbum:[arr[indexPath.row][@"is_album"] integerValue] andCover:arr[indexPath.row][@"cover"] ];
    
    [cell.cellImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"icon_683_1"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            NSLog(@"Error Loading: %@ %@",imageURL, error);
        } 
    }];

    return cell;
}

#pragma mark – UICollectionViewDelegateFlowLayout


#pragma mark – UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}





@end
