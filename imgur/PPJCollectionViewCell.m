//
//  PPJCollectionViewCell.m
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 14/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import "PPJCollectionViewCell.h"

@implementation PPJCollectionViewCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    NSLog(@"point: %@", NSStringFromCGPoint(frame.origin));
    NSLog(@"size: %@", NSStringFromCGSize(frame.size));
    
    self.cellImageView = [[UIImageView alloc]
                      initWithFrame:CGRectInset(CGRectMake(0, 0,
                                                           CGRectGetWidth(frame),
                                                           CGRectGetHeight(frame)),
                                                5, 5)];
    
    self.cellImageView.autoresizingMask =
                UIViewAutoresizingFlexibleHeight |
                UIViewAutoresizingFlexibleWidth;
    
    
    return self;
}

- (void) layoutSubviews
{
    CGRect frame = self.frame;
    self.cellImageView = [[UIImageView alloc]
                          initWithFrame:CGRectInset(CGRectMake(0, 0,
                                                               CGRectGetWidth(frame),
                                                               CGRectGetHeight(frame)),
                                                    5, 5)];
    
    self.cellImageView.autoresizingMask =
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    
}

@end
