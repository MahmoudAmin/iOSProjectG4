//
//  NetWorkManager.m
//  IOSProject
//
//  Created by JETS on 4/9/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import "NetWorkManager.h"
#import "NetWorkHandler.h"

static NetWorkHandler *objecthandler = nil;

@implementation NetWorkManager

-(NetWorkHandler *) connect{
    if (objecthandler == nil) {
        objecthandler = [NetWorkHandler new];
    }
    return objecthandler;
}

@end

//@interface JETSResponse : NSObject
//@end
