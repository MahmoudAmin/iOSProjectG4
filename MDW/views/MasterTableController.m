//
//  MasterTableController.m
//  MDW
//
//  Created by Mahmoud Ahmed Amin on 5/3/16.
//  Copyright © 2016 Mahmoud Amin. All rights reserved.
//

#import "MasterTableController.h"

@interface MasterTableController ()

@end

@implementation MasterTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    //handle table background
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    _profile_=[[JETSProfileModel new] getProfile];
//    self.tableView.contentInset = UIEdgeInsetsMake(65,0,60,0);

}

@end
