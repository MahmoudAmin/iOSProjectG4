//
//  AgendaController.h
//  MDW
//
//  Created by Mahmoud Amin on 4/27/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterTableController.h"
#import "JETSSession.h"
#import "JETSAgenda.h"
#import "JETSSessionModel.h"
#import "NetWorkManager.h"
#import "NetWorkHandler.h"
#import "NetWorkDelegate.h"
#import "SessionCell.h"
#import "SingleSessionController.h"

@interface AgendaController : MasterTableController<NetWorkDelegate>
@end
