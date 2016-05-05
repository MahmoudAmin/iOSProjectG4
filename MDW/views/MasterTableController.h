//
//  MasterTableController.h
//  MDW
//
//  Created by Mahmoud Ahmed Amin on 5/3/16.
//  Copyright © 2016 Mahmoud Amin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "JETSProfile.h"
#import "JETSProfileModel.h"
#import "UILabel+htmlViewer.h"
#import "DateHelper.h"

@interface MasterTableController : UITableViewController

    @property (strong,nonatomic) JETSProfile *profile_;

@end
