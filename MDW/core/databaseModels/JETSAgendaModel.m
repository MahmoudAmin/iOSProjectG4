//
//  JETSAgendaModel.m
//  MDW
//
//  Created by Mahmoud Ahmed Amin on 5/4/16.
//  Copyright © 2016 Mahmoud Amin. All rights reserved.
//

#import "JETSAgendaModel.h"

@implementation JETSAgendaModel
//ge day
-(NSArray*)getDaySessions:(int)index{
    return [[JETSSessionModel new] findByDate:index];
}
//insert agendas
-(void)saveAgenda:(JETSAgenda*)agenda withIndex:(int)index{
    JETSSessionModel *model=[JETSSessionModel new];
    for (JETSSession *sess in agenda.sessions) {
        sess.agendaDay=(index);
        [model createBean:sess];
        
    }
}
@end
