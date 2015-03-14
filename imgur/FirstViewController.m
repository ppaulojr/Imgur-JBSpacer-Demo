//
//  FirstViewController.m
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 13/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import "FirstViewController.h"
#import "ImgurGallery.h"
#import "PPJCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ImgurGallery sharedGallery] refreshGallery];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSString * site = [[ImgurGallery sharedGallery] gallery][@"data"][indexPath.row][@"link"];
    NSURL * url = [NSURL URLWithString:site];
    
    [cell.cellImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"icon_683_1"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            NSLog(@"Error Loading: %@ %@",imageURL, error);
        } else {
            NSLog(@"Completed: %@",imageURL);
        }
    }];

    return cell;
}

#pragma mark – UICollectionViewDelegateFlowLayout
/*

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100.0, 100.0);
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
 */

#pragma mark – UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}





@end
