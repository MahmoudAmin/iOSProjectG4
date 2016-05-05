//
//  NavigationViewController.m
//  SlideMenu
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "NavigationViewController.h"
#import "SWRevealViewController.h"
#import "JETSProfileModel.h"
@interface NavigationViewController ()

@end


@implementation NavigationViewController{
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    menu =[[NSArray alloc]initWithObjects:@"Agenda",@"My Agenda",@"Speakers",@"Exhibitors",@"Profile",@"Logout", nil];
    
    imgs = [[NSArray alloc]initWithObjects:@"agenda.png",@"myagenda.png",@"speaker.png",@"exihiptors.png",@"profile.png",@"logout.png", nil];
    
    imgView.image = [UIImage imageNamed:@"menu.png"];
    
    footer.image = [UIImage imageNamed:@"footer.png"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [menu count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(UIView* ) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerview;
    //= [[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,30)] a];
    
   // headerview.backgroundColor = [UIColor colorWithRed:0.345 green:0.31 blue:0.392 alpha:1];
    
\
    
    
    return headerview;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = [menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [menu objectAtIndex:indexPath.row ];
    cell.imageView.image = [UIImage imageNamed:imgs[indexPath.row]];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    //[cell.textLabel setBackgroundColor:[UIColor colorWithRed:0.345 green:0.31 blue:0.392 alpha:1]];

    //cell.imageView.frame = CGRectOffset(cell.frame, 50, 50);
    
                           
    // Configure the cell...
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==5){
        [[JETSProfileModel new] removeProfile];
        [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Login"] animated:YES completion:nil];
    
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
}

@end
