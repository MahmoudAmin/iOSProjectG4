//
//  SpeakersController.h
//  MDW
//
//  Created by Mahmoud Amin on 4/27/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "MasterTableController.h"
#import "NetWorkDelegate.h"

@interface SpeakersController : MasterTableController<NetWorkDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barBtn;
@end
