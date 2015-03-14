//
//  ImgurGallery.m
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 13/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import "ImgurGallery.h"
#import <AFNetworking/AFNetworking.h>

@implementation ImgurGallery
+ (instancetype)sharedGallery {
    static ImgurGallery *_sharedGallery = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedGallery = [ImgurGallery new];
    });
    
    return _sharedGallery;
}


- (void) refreshGallery
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.imgur.com/3/gallery/hot/viral/0.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.gallery = (NSDictionary *) responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
