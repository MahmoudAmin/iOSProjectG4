//
//  InfoController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/30/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "InfoController.h"
#import "JETSProfile.h"
#import "JETSProfileModel.h"
#import "NetWorkManager.h"
#import "NetWorkHandler.h"

@interface InfoController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *userTitle;
@end

@implementation InfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    UIBarButtonItem *mBtn=[[UIBarButtonItem alloc] init];
    mBtn.target = self.revealViewController;
    mBtn.action = @selector(revealToggle:);
    mBtn.image=[UIImage imageNamed:@"menuBar.png"];
    mBtn.tintColor=[UIColor orangeColor];
    self.tabBarController.navigationItem.leftBarButtonItem=mBtn;
    _userTitle.text= [NSString stringWithFormat:super.profile_.firstName,@" ",super.profile_.lastName,nil];
    [[[NetWorkManager new] connect] setImagefromUrl:super.profile_.imageURL withDefult:@"Profile.png" forImage:_imgView];
}


@end
