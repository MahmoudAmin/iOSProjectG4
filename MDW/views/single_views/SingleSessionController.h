//
//  SingleSessionController.h
//  MDW
//
//  Created by Mahmoud Amin on 4/30/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "JETSSession.h"
#import "DateHelper.h"
#import "MasterTableController.h"

@interface SingleSessionController : MasterTableController
@property JETSSession *session;
@property UITableViewController *parent;
-(void)dismissSelf;
@end
