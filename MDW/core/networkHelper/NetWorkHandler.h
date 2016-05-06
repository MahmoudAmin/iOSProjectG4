//
//  NetWorkHandler.h
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkDelegate.h"
#import "UIImageView+AFNetworking.h"
#import "Reachability.h"
//#import <SystemConfiguration/SystemConfiguration.h>

@interface NetWorkHandler : NSObject

-(void) getSpeakersWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate;
-(void) loginWithEmail:(NSString *)email andPassword:(NSString *)pass WithDelgate:(id<NetWorkDelegate>)netDelegate;
-(void) getProfileWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate;
-(void) getSessionsWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate;
-(void) getExhibitorWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate;
-(void) setImagefromUrl:(NSString*)url withDefult:(NSString*)imageNamed
               forImage:(UIImageView*)image inCell:(UITableViewCell*) cell;
-(void) setImagefromUrl:(NSString*)url withDefult:(NSString*)imageNamed
               forImage:(UIImageView*)image;
@end

