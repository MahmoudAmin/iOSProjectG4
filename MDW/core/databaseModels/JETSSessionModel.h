//
//  JETSSessionModel.h
//  Database1
//
//  Created by JETS on 4/9/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JETSAbstractModel.h"
#import "JETSDBConnectionFactory.h"
#import "JETSSession.h"

@interface JETSSessionModel : NSObject <JETSAbstractModel>{
    
    JETSDBConnectionFactory *connection;
    
}
-(id)findByDate:(int)date_;
-(NSArray*)getLikedSessions;
-(NSArray*)getLikedSessionsAtDay:(int)index;

@end
