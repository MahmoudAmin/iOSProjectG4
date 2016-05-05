//
//  SpeakersController.m
//  MDW
//
//  Created by Mahmoud Amin on 4/27/16.
//  Copyright (c) 2016 Mahmoud Amin. All rights reserved.
//

#import "SpeakersController.h"
#import "JETSSpeaker.h"
#import "NetWorkManager.h"
#import "NetWorkHandler.h"
#import "SingleSpeakerController.h"
#import "JETSSpeakerModel.h"

@interface SpeakersController ()
@property NSArray *speakers;
@end

@implementation SpeakersController


- (void)viewDidLoad {
    [super viewDidLoad];
    _barBtn.target = self.revealViewController;
    _barBtn.action = @selector(revealToggle:);
    
    //start network
    NetWorkHandler *NM = [[NetWorkManager new ] connect];
    [NM getSpeakersWithEmail:super.profile_.email WithDelgate:self];
    
    //prepre refresh
    self.refreshControl=[[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor=[UIColor purpleColor];
    self.refreshControl.tintColor=[UIColor whiteColor];
    [self.refreshControl addTarget:self action:@selector(getLatestSpeaker) forControlEvents:UIControlEventValueChanged];
}



-(void)getLatestSpeaker{
    [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
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
        [self.refreshControl endRefreshing];
        
    }
    
}



-(void) handleSuccess:(id) data{
    _speakers = data ;
    [self.tableView reloadData];
   JETSSpeakerModel *model= [JETSSpeakerModel new];
    [model removeALL];
    for (JETSSpeaker *speaker in _speakers) {
        [model createBean:speaker];
    }
}
-(void) handleFaild{
    _speakers=[[JETSSpeakerModel new] findAll];
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpeakerCell" forIndexPath:indexPath];
    JETSSpeaker *speaker =[_speakers objectAtIndex:indexPath.row];
    [[[NetWorkManager new] connect] setImagefromUrl:speaker.imageURL withDefult:@"speaker.png" forImage:cell.imageView inCell:cell];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@",speaker.firstName,speaker.lastName]];
    [cell.detailTextLabel setText:speaker.companyName];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [_speakers count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SingleSpeakerController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SingleSpeaker"];
    vc.speaker=[_speakers  objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
