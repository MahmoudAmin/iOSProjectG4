//
//  LoginController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/27/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "LoginController.h"
#import "SWRevealViewController.h"
#import "JETSProfile.h"
#import "JETSProfileModel.h"
#import "NetWorkManager.h"
#import "NetWorkHandler.h"
#import "JETSResponse.h"


@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *userEmail;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property(strong,nonatomic) UIActivityIndicatorView *indicator;
@end

@implementation LoginController

- (IBAction)onLoginClick:(UIButton *)sender {
    [[[NetWorkManager new] connect] loginWithEmail:_userEmail.text andPassword:_userPassword.text WithDelgate:self];
    _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    _indicator.center = self.view.center;
    [self.view addSubview:_indicator];
    [_indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    [_indicator startAnimating];
}


- (IBAction)onRegisterClick:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://mobiledeveloperweekend.net/attendee/registration.htm"]];    
}

-(void)handleSuccess:(id)data{
    [_indicator stopAnimating];
    JETSResponse *reponse=data;
    if (reponse.status) {
        JETSProfile *profil=reponse.data;
        [[JETSProfileModel new] createProfile:profil];
        [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"] animated:YES completion:nil];
    }else{
        UIAlertView *alert =
        [[UIAlertView alloc]initWithTitle:@"Error" message:reponse.data delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}
-(void)handleFaild{
[_indicator stopAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
}
-(void)viewDidAppear:(BOOL)animated{
    if ([[JETSProfileModel new] getProfile]) {
        [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"] animated:YES completion:nil];
    }
    [super viewDidAppear:animated];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
