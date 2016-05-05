//
//  AgendaThirdDayController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/30/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "AgendaThirdDayController.h"

@interface AgendaThirdDayController ()
@property NSArray *sessions;
@end

@implementation AgendaThirdDayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *mBtn=[[UIBarButtonItem alloc] init];
    mBtn.target = self.revealViewController;
    mBtn.action = @selector(revealToggle:);
    mBtn.image=[UIImage imageNamed:@"menuBar.png"];
    mBtn.tintColor=[UIColor orangeColor];
    self.tabBarController.navigationItem.leftBarButtonItem=mBtn;
    _sessions=[[JETSAgendaModel new] getDaySessions:3];

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


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
