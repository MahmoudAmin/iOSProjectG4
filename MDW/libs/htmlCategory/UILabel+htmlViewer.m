//
//  UILabel+myLabel.m
//  labeeel
//
//  Created by JETS on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "UILabel+htmlViewer.h"

@implementation UILabel (htmlViewer)
-(void)renderHTML:(NSString *)htmlStr {
    NSAttributedString *attrStr=[[NSAttributedString alloc]initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    [self setText:[attrStr string]];
}
+(NSString*) convertToHTML :(NSString*)htmlStr{
    NSAttributedString *attrStr=[[NSAttributedString alloc]initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    return [attrStr string];
}
@end
