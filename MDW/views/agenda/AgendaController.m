//
//  AgendaController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/27/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "AgendaController.h"
#import "JETSAgendaModel.h"
@interface AgendaController ()
@property NSMutableArray *sessions;
@end

@implementation AgendaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *mBtn=[[UIBarButtonItem alloc] init];
    mBtn.target = self.revealViewController;
    mBtn.action = @selector(revealToggle:);
    mBtn.image=[UIImage imageNamed:@"menuBar.png"];
    mBtn.tintColor=[UIColor orangeColor];
    self.tabBarController.navigationItem.leftBarButtonItem=mBtn;
    //load data
    _sessions=[NSMutableArray new];
    [[[NetWorkManager new] connect] getSessionsWithEmail:super.profile_.email WithDelgate:self];
    
}
-(void) handleSuccess:(id) data{
    int index=0;
    JETSAgendaModel *model= [JETSAgendaModel new];
    [[JETSSessionModel new] removeALL];
    for (JETSAgenda *agenda in data) {
        [_sessions addObjectsFromArray:agenda.sessions];
        index++;
        [model saveAgenda:agenda withIndex:index];
    }
    [self.tableView reloadData];
}
-(void) handleFaild{
    JETSSessionModel *model=[JETSSessionModel new];
    _sessions=[model findAll];
    [self.tableView reloadData];
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
