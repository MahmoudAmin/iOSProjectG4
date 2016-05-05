//
//  JETSDBConnectionFactory.h
//  Database1
//
//  Created by Mahmoud Amin on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface JETSDBConnectionFactory : NSObject
+(JETSDBConnectionFactory*)getInstance;
-(Boolean)excuteUpdate:(NSString*)query;
-(FMResultSet*)excuteQuery:(NSString*)query;
@end
