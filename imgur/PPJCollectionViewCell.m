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
    
    self.cellImageView = [[UIImageView alloc]
                      initWithFrame:CGRectInset(CGRectMake(0, 0,
                                                           CGRectGetWidth(frame),
                                                           CGRectGetHeight(frame)),
                                                5, 5)];
    
    self.cellImageView.autoresizingMask =
                UIViewAutoresizingFlexibleHeight |
                UIViewAutoresizingFlexibleWidth;
    
    [self.contentView addSubview:self.cellImageView];
    
    self.backgroundColor = [UIColor redColor];
    
    return self;
}

@end
