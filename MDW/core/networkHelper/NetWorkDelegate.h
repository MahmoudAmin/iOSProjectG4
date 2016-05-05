//
//  NetWorkDelegate.h
//  IOSProject
//
//  Created by JETS on 4/9/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetWorkDelegate <NSObject>

-(void) handleSuccess:(id) data;
-(void) handleFaild;

@end
