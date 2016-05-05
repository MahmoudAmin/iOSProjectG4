//
//  MyTicketController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/30/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "MyTicketController.h"
#import "ZXingObjC.h"

@interface MyTicketController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageTicket;

@end

@implementation MyTicketController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    UIBarButtonItem *mBtn=[[UIBarButtonItem alloc] init];
    mBtn.target = self.revealViewController;
    mBtn.action = @selector(revealToggle:);
    mBtn.image=[UIImage imageNamed:@"menuBar.png"];
    mBtn.tintColor=[UIColor orangeColor];
    self.tabBarController.navigationItem.leftBarButtonItem=mBtn;

    ZXMultiFormatWriter *writer = [[ZXMultiFormatWriter alloc] init];
    ZXBitMatrix *result = [writer encode:super.profile_.code
                                  format:kBarcodeFormatQRCode
                                   width:self.imageTicket.frame.size.width
                                  height:self.imageTicket.frame.size.width
                                   error:nil];
    
    if (result) {
        ZXImage *image = [ZXImage imageWithMatrix:result];
        self.imageTicket.image = [UIImage imageWithCGImage:image.cgimage];
    } else {
        self.imageTicket.image = nil;
    }
}
@end
