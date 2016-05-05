//
//  SingleSessionController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/30/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "SingleSessionController.h"

@interface SingleSessionController ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIButton *btnStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblFromTo;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;
@end

@implementation SingleSessionController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *mBtn=[[UIBarButtonItem alloc] init];
    mBtn.target = self;
    mBtn.action = @selector(dismissSelf);
    mBtn.image=[UIImage imageNamed:@"leftArrow.png"];
    mBtn.tintColor=[UIColor orangeColor];
    self.navigationItem.leftBarButtonItem=mBtn;
    [_lblTitle renderHTML:_session.name];
    _lblLocation.text=_session.location;
    _lblFromTo.text=[[DateHelper new] difrenceBetweenStartDate:_session.startDate EndDate:_session.endDate];
    _lblDate.text=[[DateHelper new] representDate:_session.startDate];
    _txtDescription.text=[UILabel convertToHTML:_session.desc];

}
-(void)dismissSelf{
   UIViewController *par= [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:par animated:YES];
}

- (IBAction)statusOnClick:(id)sender {
    
}




@end
