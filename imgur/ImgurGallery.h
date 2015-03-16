//
//  ImgurGallery.h
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 13/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImgurGalleryDelegate;

@interface ImgurGallery : NSObject
@property (nonatomic, strong) NSDictionary * gallery;
@property (assign, nonatomic) id<ImgurGalleryDelegate> delegate;

+ (instancetype)sharedGallery;
- (void) refreshGallery;

@end

@protocol ImgurGalleryDelegate <NSObject>

- (void) imgurDidLoadNewJSON;

@end
