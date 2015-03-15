//
//  ImgurImage.m
//  imgur
//
//  Created by Pedro Paulo Oliveira Junior on 15/03/15.
//  Copyright (c) 2015 Netfilter. All rights reserved.
//

#import "ImgurImage.h"

@implementation ImgurImage

+ (NSURL *) imageURLFromId:(NSString *)imId withType:(NSString *)imType andIsAlbum:(NSInteger)isAlbum andCover:(NSString *)cover
{
    NSString * string = @"http://i.imgur.com/";
    if (isAlbum == 0) {
        string = [string stringByAppendingString:imId];
        if ([imType isEqualToString:@"image/jpeg"]) {
            string = [string stringByAppendingString:@"m.jpg"];
        } else if ([imType isEqualToString:@"image/png"])
        {
            string = [string stringByAppendingString:@"m.png"];
        } else if ([imType isEqualToString:@"image/png"]) {
            string = [string stringByAppendingString:@"m.gif"];
        } else {
            string = [string stringByAppendingString:@".jpg"];
        }
    } else {
        string = [string stringByAppendingString:cover];
        string = [string stringByAppendingString:@"m.jpg"];
    }
    return [NSURL URLWithString:string];
}

@end
