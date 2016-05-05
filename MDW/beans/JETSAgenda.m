//
//  JETSAgenda.m
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSAgenda.h"

@implementation JETSAgenda

-(id)initWithDate:(long)date_ sessions:(NSMutableArray *)sessions_
{
    self = [super init];
    if (self) {
        self.date = date_;
        self.sessions = [sessions_ mutableCopy];
    }
    return self;
}

@end
