//
//  NetWorkHandler.m
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import "NetWorkHandler.h"
#import "AFNetworking.h"
#import "JETSSpeaker.h"
#import "JETSProfile.h"
#import "JETSAgenda.h"
#import "JETSSession.h"
#import "JETSResponse.h"
#import "JETSExhibitor.h"

@implementation NetWorkHandler
//load image
-(void)setImagefromUrl:(NSString*)url withDefult:(NSString*)imageNamed forImage:(UIImageView*)image inCell:(UITableViewCell*) cell
{
    [image setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageNamed]];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    UIImage *placeholderImage = [UIImage imageNamed:imageNamed];
    
    __weak UITableViewCell *weakCell = cell;
    
    [cell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCell.imageView.image = image;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
}
//check connection
- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

-(void) loginWithEmail:(NSString *)email andPassword:(NSString *)pass WithDelgate:(id<NetWorkDelegate>)netDelegate{
    __block NSDictionary *mydic=[NSDictionary new];
    NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/login?userName=%@&password=%@",email,pass];

    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        mydic= (NSDictionary *)responseObject;
        NSString *status = [responseObject objectForKey:@"status"];
        NSMutableDictionary *profileDic = [responseObject objectForKey:@"result"];
        JETSResponse *response_=[JETSResponse new];
        if([status isEqualToString:@"view.error"]){
                response_.status=false;
                response_.data=profileDic;
            }else{
                response_.status=true;
                JETSProfile *profile=[JETSProfile new];
                [profile setId:[[profileDic objectForKey:@"id"]integerValue]];
                [profile setFirstName:[profileDic objectForKey:@"firstName"]];
                [profile setMiddleName:[profileDic objectForKey:@"middleName"]];
                [profile setLastName:[profileDic objectForKey:@"lastName"]];
                [profile setEmail:[profileDic objectForKey:@"email"]];
                [profile setCountryName:[profileDic objectForKey:@"country"]];
                [profile setCityName:[profileDic objectForKey:@"cityName"]];
                [profile setTitle:[profileDic objectForKey:@"title"]];
                [profile setCode:[profileDic objectForKey:@"code"]];
                [profile setImageURL:[profileDic objectForKey:@"imageURL"]];

                response_.data=profile;
       }
        [netDelegate handleSuccess:response_];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert =
        [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [netDelegate handleFaild];
    }];
    
    [operation start];
}

-(void) getProfileWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate{
//geting url of webservice
    __block NSDictionary *mydic=[NSDictionary new];
    NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getAttendeeProfile?userName=%@",email];
    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        mydic= (NSDictionary *)responseObject;
        NSMutableDictionary *profileDic = [responseObject objectForKey:@"result"];
        JETSProfile *profile=[JETSProfile new];
        [profile setId:[[profileDic objectForKey:@"id"]integerValue]];
        [profile setFirstName:[profileDic objectForKey:@"firstName"]];
        [profile setMiddleName:[profileDic objectForKey:@"middleName"]];
        [profile setLastName:[profileDic objectForKey:@"lastName"]];
        [profile setEmail:[profileDic objectForKey:@"email"]];
        [profile setCountryName:[profileDic objectForKey:@"country"]];
        [profile setCityName:[profileDic objectForKey:@"cityName"]];
        [profile setTitle:[profileDic objectForKey:@"title"]];
        [profile setImageURL:[profileDic objectForKey:@"imageURL"]];
        
        NSMutableArray *ArrayOPhones = [profileDic objectForKey:@"phones"];
         for (int i2=1; i2<[ArrayOPhones count]; i2++) {
                NSMutableDictionary *phonesDict =[ArrayOPhones objectAtIndex:i2];
                [profile setPhones:[phonesDict objectForKey:@"phones"]];
            }
            NSMutableArray *ArrayOfMobiles = [profileDic objectForKey:@"mobiles"];
            for (int i3=1; i3<[ArrayOfMobiles count]; i3++) {
                NSMutableDictionary *mobilesDict =[ArrayOfMobiles objectAtIndex:i3];
                [profile setMobiles:[mobilesDict objectForKey:@"mobiles"]];
            }
        
        
        [netDelegate handleSuccess:profile];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [netDelegate handleFaild];
    }];
    
    [operation start];
}

-(void) getSpeakersWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate{
//geting url of webservice
    __block NSDictionary *mydic=[NSDictionary new];

    //geting url of webservice
    NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=%@",email];
    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        mydic = (NSDictionary *)responseObject;
        
        NSMutableArray *arrayOfSpeakers = [mydic objectForKey:@"result"];
        
        NSMutableArray *speakers=[NSMutableArray new];
        
        for (int i=1; i<[arrayOfSpeakers count]; i++)
        {
            
            
            NSMutableDictionary *speakerDict = [arrayOfSpeakers objectAtIndex:i];
            
            JETSSpeaker *speaker = [JETSSpeaker new];
            
            [speaker setId:[[speakerDict objectForKey:@"id"]integerValue]];
            [speaker setFirstName:[speakerDict objectForKey:@"firstName"]];
            [speaker setMiddleName:[speakerDict objectForKey:@"middleName"]];
            [speaker setLastName:[speakerDict objectForKey:@"lastName"]];
            //[speaker setGender:[speakerDict objectForKey:@"gender"]];
            [speaker setCompanyName:[speakerDict objectForKey:@"companyName"]];
            [speaker setBiography:[speakerDict objectForKey:@"biography"]];
            [speaker setImageURL:[speakerDict objectForKey:@"imageURL"]];
            [speaker setTitle:[speakerDict objectForKey:@"title"]];
            NSMutableArray *ArrayOPhones = [speakerDict objectForKey:@"phones"];
            for (int i2=1; i2<[ArrayOPhones count]; i2++) {
                NSMutableDictionary *phonesDict =[ArrayOPhones objectAtIndex:i2];
                [speaker setPhones:[phonesDict objectForKey:@"phones"]];
            }
            NSMutableArray *ArrayOfMobiles = [speakerDict objectForKey:@"mobiles"];
            for (int i3=1; i3<[ArrayOfMobiles count]; i3++) {
                NSMutableDictionary *mobilesDict =[ArrayOfMobiles objectAtIndex:i3];
                [speaker setMobiles:[mobilesDict objectForKey:@"mobiles"]];
            }
            [speakers addObject:speaker];
        }
        [netDelegate handleSuccess: [speakers copy]];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [netDelegate handleFaild];
    }];
    [operation start];
}

-(void) getSessionsWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate{
  //geting url of webservice
    __block NSDictionary *mydic=[NSDictionary new];

 NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getSessions?userName=%@",email];
 
 mydic=[NSDictionary new];
 NSURL *url = [NSURL URLWithString:mystring];
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
 
 // 2
 AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
 operation.responseSerializer = [AFJSONResponseSerializer serializer];
 
 [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
 
 // 3
 
 mydic= (NSDictionary *)responseObject;
 NSDictionary *dicOfResult = [mydic objectForKey:@"result"];
 NSMutableArray *agendas=[dicOfResult objectForKey:@"agendas"];
 NSMutableArray *arrayOfAgendas=[NSMutableArray new];
 
 for (int i=0; i<[agendas count]; i++) {
 NSMutableDictionary *agendaDict = [agendas objectAtIndex:i];

     JETSAgenda *agenda=[JETSAgenda new];
 NSString *dateString=[agendaDict objectForKey:@"date"];
 double getDate=[dateString doubleValue];
 [agenda setDate:getDate];
 NSMutableArray *sessions=[NSMutableArray new];
 sessions=[agendaDict objectForKey:@"sessions"];
 NSMutableArray *arrayOfSessions=[NSMutableArray new];
 for (int i=0; i<[sessions count]; i++) {
 NSMutableDictionary *sessionDict = [sessions objectAtIndex:i];
 JETSSession *session=[JETSSession new];
     [session setName:[sessionDict objectForKey:@"name"]];
     [session setLocation:[sessionDict objectForKey:@"location"]];
 [session setId:[[sessionDict objectForKey:@"id"] integerValue]];
 [session setDesc:[sessionDict objectForKey:@"description"]];
 [session setStatus:[[sessionDict objectForKey:@"status"] integerValue]];
 [session setSessionType:[sessionDict objectForKey:@"sessionType"]];
 [session setLiked:[sessionDict objectForKey:@"like"]];
 [session setSessionTags:[sessionDict objectForKey:@"sessionTags"]];
 [session setSpeakers:[sessionDict objectForKey:@"speakers"]];
     
  NSString *sdateString=[sessionDict objectForKey:@"startDate"];
 [session setStartDate:[sdateString doubleValue]];

     
 NSString *edateString=[sessionDict objectForKey:@"endDate"];
 [session setEndDate:[edateString doubleValue]];
 [arrayOfSessions addObject:session];
 }
 
 [agenda setSessions:arrayOfSessions];
 [arrayOfAgendas addObject:agenda];
 }
 
 [netDelegate handleSuccess: [arrayOfAgendas copy]];
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 
 // 4
 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
 message:[error localizedDescription]
 delegate:nil
 cancelButtonTitle:@"Ok"
 otherButtonTitles:nil];
 [alertView show];
     [netDelegate handleFaild];
 }];
 
 // 5
 [operation start];
 }

-(void)getExhibitorWithEmail:(NSString *)email WithDelgate:(id<NetWorkDelegate>)netDelegate{
   //geting url of webservice
    __block NSDictionary *mydic=[NSDictionary new];

    NSString *myexhibitor=[NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getExhibitors?userName=%@",email];
    mydic=[NSDictionary new];
    NSURL *myurl=[NSURL URLWithString:myexhibitor];
    NSURLRequest *myrequest=[NSURLRequest requestWithURL:myurl];
    AFHTTPRequestOperation *myoperation=[[AFHTTPRequestOperation alloc]initWithRequest:myrequest];
    myoperation.responseSerializer =[AFJSONResponseSerializer serializer];
    [myoperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *myoperation, id responseObject) {
        mydic = (NSDictionary *)responseObject;
        NSMutableArray *exhibitors=[NSMutableArray new];
        NSMutableArray *arrayOfExhibitors = [mydic objectForKey:@"result"];
        for (int i=1; i<[arrayOfExhibitors count]; i++ ) {
            NSMutableDictionary *exhibitorDict = [arrayOfExhibitors objectAtIndex:i];
            JETSExhibitor *exhibitor=[JETSExhibitor new];
            
            [exhibitor setImageURL:[exhibitorDict objectForKey:@"imageURL"]];
            [exhibitor setCompanyAddress:[exhibitorDict objectForKey:@"companyAddress"]];
            [exhibitor setCompanyAbout:[exhibitorDict objectForKey:@"companyAbout"]];
            [exhibitor setFax:[exhibitorDict objectForKey:@"fax"]];
            [exhibitor setContactName:[exhibitorDict objectForKey:@"contactName"]];
            [exhibitor setContactTitle:[exhibitorDict objectForKey:@"contactTitle"]];
            [exhibitor setCompanyUrl:[exhibitorDict objectForKey:@"companyUrl"]];
            [exhibitor setEmail:[exhibitorDict objectForKey:@"email"]];
            [exhibitor setCountryName:[exhibitorDict objectForKey:@"countryName"]];
            [exhibitor setCityName:[exhibitorDict objectForKey:@"cityName"]];
            [exhibitor setCompanyName:[exhibitorDict objectForKey:@"companyName"]];
            [exhibitor setId:[[exhibitorDict objectForKey:@"id"]integerValue]];
            
           /*   NSMutableArray *myArrayOPhones = [exhibitorDict objectForKey:@"phones"];
             for (int b=1; b<[myArrayOPhones count]; b++) {
             NSMutableDictionary *myphonesDict =[myArrayOPhones objectAtIndex:b];
             [exhibitor setPhones:[myphonesDict objectForKey:@"phones"]];
             }
            */
            
            NSMutableArray *myarrayofmobiles = [exhibitorDict objectForKey:@"mobiles"];
            for (int m=1; m<[myarrayofmobiles count]; m++) {
                NSMutableDictionary *mymobilesDict =[myarrayofmobiles objectAtIndex:m];
                [exhibitor setMobiles:[mymobilesDict objectForKey:@"mobiles"]];
            }
            [exhibitors addObject:exhibitor];
        }
        //exhibitors
        [netDelegate handleSuccess: [exhibitors  copy]];
    }
     
     
   failure:^(AFHTTPRequestOperation *myoperation, NSError *error) {
        [netDelegate handleFaild];
    }];
    
    [myoperation start];
}


@end
