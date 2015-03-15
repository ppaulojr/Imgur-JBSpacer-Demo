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
#import <JBSpacer.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Load size: %@", NSStringFromCGSize(self.view.frame.size));
    JBSpacerOption *option = [JBSpacerOption optionWithItemSize:90.0f
                                                  minimumGutter:1.0f
                                            gutterToMarginRatio:1.0f
                                                  availableSize:self.view.frame.size.width
                                       distributeExtraToMargins:YES];
    JBSpacer *spacer = [JBSpacer spacerWithOption:option];
    
    NSLog(@"layout: (itemCount: %d margin:%f gutter:%f extra:%f) %@",spacer.spacing.itemCount,
          spacer.spacing.margin, spacer.spacing.gutter, spacer.spacing.extra,spacer.option);
    [self.collectionView.collectionViewLayout invalidateLayout];
    /*[[ImgurGallery sharedGallery] refreshGallery];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //[self.collectionView reloadData];
    }); */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [spacer applySpacingToCollectionViewFlowLayout:self.flowLayout];
    });
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
    if (arr.count == 0) {
        return 90;
    }
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"MyCell";
    PPJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    NSArray * arr = [[ImgurGallery sharedGallery] gallery][@"data"];
    if (arr.count == 0)
    {
        cell.cellImageView.image = [UIImage imageNamed:@"icon_683_1"];
        return cell;
    }
    NSString * site = arr[indexPath.row][@"link"];
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


#pragma mark – UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}





@end
