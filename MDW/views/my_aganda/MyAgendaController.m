//
//  AgendaController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/27/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "MyAgendaController.h"
#import "JETSSessionModel.h"
@interface MyAgendaController ()
@property NSArray *sessions;
@end

@implementation MyAgendaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *mBtn=[[UIBarButtonItem alloc] init];
    mBtn.target = self.revealViewController;
    mBtn.action = @selector(revealToggle:);
    mBtn.image=[UIImage imageNamed:@"menuBar.png"];
    mBtn.tintColor=[UIColor orangeColor];
    self.tabBarController.navigationItem.leftBarButtonItem=mBtn;
    //load data
    _sessions =[[JETSSessionModel new] getLikedSessions];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellSession";
    SessionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    JETSSession *sess = [_sessions  objectAtIndex:indexPath.row];
    [cell.sessionName renderHTML:sess.name];
    cell.sessionImage.image=[UIImage imageNamed:[sess.sessionType stringByAppendingString:@".png"]];
    cell.sessionPlace.text=sess.location;
    cell.sessionTime.text=[[DateHelper new] difrenceBetweenStartDate:sess.startDate EndDate:sess.endDate];
    cell.sessionDay.text=[[DateHelper new] getDaynmber:sess.startDate];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _sessions.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SingleSessionController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SingleSession"];
    vc.session=[_sessions  objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
