//
//  NetWorkManager.h
//  IOSProject
//
//  Created by JETS on 4/9/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkHandler.h"

@interface NetWorkManager : NSObject


@property NetWorkHandler *objecthandler;

-(NetWorkHandler *) connect;

@end
