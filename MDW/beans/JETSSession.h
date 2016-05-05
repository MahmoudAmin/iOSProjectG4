//
//  JETSSession.h
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSSession : NSObject

@property NSString *name;
@property NSString *size;
@property NSString *color;
@property NSString *location;
@property long id;
@property NSString *desc;
@property NSInteger status;
@property NSString *sessionType;
@property NSString *liked;
@property NSMutableArray *sessionTags;
@property NSMutableArray *speakers;
@property long date;
@property long startDate;
@property long endDate;
@property int agendaDay;

-(id)initWithName:(NSString *)name_ size:(NSString *)size_ color:(NSString *)color_ location:(NSString *)location_ id:(long)id_ description:(NSString *)description_ status:(int)status_ sessionType:(NSString *)sessionType_ liked:(NSString *)liked_ sessionTags:(NSMutableArray *)sessionTags_ speakers:(NSMutableArray *)speakers_ date:(long)date_ startDate:(long)startDate_ endDate:(long)endDate_;

@end
