//
//  JETSSession.m
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSSession.h"

@implementation JETSSession

-(id)initWithName:(NSString *)name_ size:(NSString *)size_ color:(NSString *)color_ location:(NSString *)location_ id:(long)id_ description:(NSString *)description_ status:(int)status_ sessionType:(NSString *)sessionType_ liked:(NSString *)liked_ sessionTags:(NSMutableArray *)sessionTags_ speakers:(NSMutableArray *)speakers_ date:(long)date_ startDate:(long)startDate_ endDate:(long)endDate_
{

    self = [super init];
    if (self) {
        self.name = name_;
        self.size = size_;
        self.color = color_;
        self.location = location_;
        self.id = id_;
        self.desc = description_;
        self.status = status_;
        self.sessionType = sessionType_;
        self.liked = liked_;
        self.sessionTags = [sessionTags_ mutableCopy];
        self.speakers = [speakers_ mutableCopy];
        self.date = date_;
        self.startDate = startDate_;
        self.endDate = endDate_;
    }
    return self;
    
}

@end
