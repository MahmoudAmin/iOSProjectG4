//
//  JETSAgenda.h
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSAgenda : NSObject

@property long date;
@property NSMutableArray *sessions;

-(id)initWithDate:(long)date_ sessions:(NSMutableArray *)sessions_;

@end