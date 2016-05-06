//
//  SingleSpeakerController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/30/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "SingleSpeakerController.h"
#import "SpeakersController.h"

@interface SingleSpeakerController ()

@end

@implementation SingleSpeakerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *mBtn=[[UIBarButtonItem alloc] init];
    mBtn.target = self;
    mBtn.action = @selector(dismissSelf);
    mBtn.image=[UIImage imageNamed:@"leftArrow.png"];
    mBtn.tintColor=[UIColor orangeColor];
    self.navigationItem.leftBarButtonItem=mBtn;
    // [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _compName.lineBreakMode = NSLineBreakByWordWrapping ; // 3alashan ya3mel multiline fel table
    _compName.numberOfLines = 0;
    
    [_Name setText:[NSString stringWithFormat:@"%@ %@",_speaker.firstName,_speaker.lastName]];
    [_compName renderHTML:_speaker.title];
    [_job setText:_speaker.companyName];
    [_txtView setText:_speaker.biography];
    [[[NetWorkManager new] connect] setImagefromUrl:_speaker.imageURL withDefult:@"Speaker.png" forImage:_imgView];
    
    
}
-(void)dismissSelf{
    UIViewController *par= [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:par animated:YES];
}

@end
