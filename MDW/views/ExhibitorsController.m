//
//  ExhibitorsController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/27/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "ExhibitorsController.h"
#import "SWRevealViewController.h"
#import "JETSExhibitor.h"
#import "NetWorkHandler.h"
#import "NetWorkDelegate.h"
#import "NetWorkManager.h"
#import "JETSExhibitorModel.h"

@interface ExhibitorsController (){
    NSArray *responseData;

}

@end

@implementation ExhibitorsController

- (void)viewDidLoad {
    [super viewDidLoad];
    _barBtn.target = self.revealViewController;
    _barBtn.action = @selector(revealToggle:);
    NetWorkManager *netMang=[NetWorkManager new];
    NetWorkHandler *netcal=[netMang connect];
    [netcal getExhibitorWithEmail:super.profile_.email WithDelgate:self];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[responseData [indexPath.row] companyUrl]]];
    
}
-(void) handleSuccess:(id) data{
    responseData =data;
    [self.tableView  reloadData];

}
-(void) handleFaild{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please check your connection" delegate:nil cancelButtonTitle:@"" otherButtonTitles:@"Ok", nil];
    [alert show];
}

-(void)getLatestExhibitors{
    [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    [self.refreshControl endRefreshing];
}

- (void)reloadData
{
    // Reload table data
    [self.tableView reloadData];
    if(self.refreshControl){
        
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM d,h:mm a"];
        NSString *title=[NSString stringWithFormat:@"Last update: %@",[formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle=[[NSAttributedString alloc]initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle=attributedTitle;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [responseData count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exhibitor" forIndexPath:indexPath];
    [cell.textLabel setText:[[responseData objectAtIndex:indexPath.row]companyName]];
    JETSExhibitor *expt=[responseData objectAtIndex:indexPath.row];
    [[[NetWorkManager new] connect] setImagefromUrl:expt.imageURL withDefult:@"exihiptors.png" forImage:cell.imageView inCell:cell];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}
@end
