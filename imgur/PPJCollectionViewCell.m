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
    
    [self.cellImageView setFrame: CGRectInset(CGRectMake(0, 0,
                                                         CGRectGetWidth(frame),
                                                         CGRectGetHeight(frame)),
                                              2, 2)];
    
    self.cellImageView.autoresizingMask =
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    
    
    return self;
}

- (void) layoutSubviews
{
    CGRect frame = self.frame;
    [self.cellImageView setFrame: CGRectInset(CGRectMake(0, 0,
                                              CGRectGetWidth(frame),
                                              CGRectGetHeight(frame)),
                                                    2, 2)];
    
    self.cellImageView.autoresizingMask =
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
}

@end
