//
//  ImgurGallery.h
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 13/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImgurGallery : NSObject
@property (nonatomic, strong) NSDictionary * gallery;

+ (instancetype)sharedGallery;
- (void) refreshGallery;

@end
