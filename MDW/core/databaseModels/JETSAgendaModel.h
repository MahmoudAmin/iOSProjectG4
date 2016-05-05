//
//  JETSAgendaModel.h
//  MDW
//
//  Created by Mahmoud Ahmed Amin on 5/4/16.
//  Copyright © 2016 Mahmoud Amin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JETSDBConnectionFactory.h"
#import "JETSSessionModel.h"
#import "JETSAgenda.h"
@interface JETSAgendaModel : NSObject
//ge day
-(NSArray*)getDaySessions:(int)index;

//insert agendas
-(void)saveAgenda:(JETSAgenda*)agenda withIndex:(int)index;
@end
