//
//  ImgurImage.h
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 15/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImgurImage : NSObject
+ (NSURL *) imageURLFromId:(NSString *)imId withType:(NSString *)imType andIsAlbum:(NSInteger)isAlbum andCover:(NSString *)cover;

@end
