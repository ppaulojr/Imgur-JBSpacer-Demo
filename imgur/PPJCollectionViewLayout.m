//
//  PPJCollectionViewLayout.m
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 14/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import "PPJCollectionViewLayout.h"

@implementation PPJCollectionViewLayout

-(id)init
{
    self = [super init];
    if (!self)
    {
        return  nil;
    }
    NSLog(@"layout: %@",self);
    
    self.itemSize = CGSizeMake(130, 130);
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.minimumInteritemSpacing = 10.0f;
    self.minimumLineSpacing = 10.0f;
    
    return self;
}

@end
