//
//  UILabel+myLabel.h
//  labeeel
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (htmlViewer)
-(void) renderHTML :(NSString*)string;
+(NSString*) convertToHTML :(NSString*)htmlStr;

@end
