//
//  JETSSpeakerModel.m
//  Database1
//
//  Created by Mahmoud Amin on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSSpeakerModel.h"

@implementation JETSSpeakerModel

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        connection=[JETSDBConnectionFactory getInstance];
        
    }
    
    return self;
    
}

-(void)createBean:(id)bean{
    
    JETSSpeaker *speaker=(JETSSpeaker *) bean;
    
    NSString *insertSQL = [NSString stringWithFormat:
                           @"INSERT INTO Speaker (id, gender, imageURL, middleName, biography, firstName, lastName, companyName, title, phones, mobiles) VALUES (%ld, '%@', '%@', '%@', \"%@\", '%@', '%@', '%@', '%@', '%@', '%@')",
                           speaker.id, speaker.gender, speaker.imageURL, speaker.middleName, speaker.biography, speaker.firstName, speaker.lastName, speaker.companyName, speaker.title, [speaker.phones componentsJoinedByString:@","], [speaker.mobiles componentsJoinedByString:@","]];
    
    [connection excuteUpdate:insertSQL];
    
}

-(void)removeBean:(id)bean{
    
    JETSSpeaker *speaker=(JETSSpeaker *) bean;
    
    NSString *deleteSQL = [NSString stringWithFormat:@"Delete FROM Speaker WHERE id=%ld",speaker.id];
    
    [connection excuteUpdate:deleteSQL];
    
}

-(id)findById:(id)id_{
    
    long myId=(long)id_;
    
    NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM Speaker WHERE id=%ld",myId];
    
    FMResultSet *rs=[connection excuteQuery:querySQL];
    
    JETSSpeaker *speaker=[JETSSpeaker new];
    
    while ([rs next]) {
        
        speaker.id = [rs longForColumn:@"id"];
        speaker.gender = [rs stringForColumn:@"gender"];
        speaker.imageURL = [rs stringForColumn:@"imageURL"];
        speaker.middleName = [rs stringForColumn:@"middleName"];
        speaker.biography = [rs stringForColumn:@"biography"];
        speaker.firstName = [rs stringForColumn:@"firstName"];
        speaker.lastName = [rs stringForColumn:@"lastName"];
        speaker.companyName = [rs stringForColumn:@"companyName"];
        speaker.title = [rs stringForColumn:@"title"];
        
        //mutable array can be init with normal array
        NSMutableArray *phonesArray =[NSMutableArray arrayWithArray:[[rs stringForColumn:@"phones"] componentsSeparatedByString:@","]];
        NSMutableArray *mobilesArray =[NSMutableArray arrayWithArray:[[rs stringForColumn:@"mobiles"] componentsSeparatedByString:@","]];
        
        speaker.phones = [phonesArray mutableCopy];
        speaker.mobiles = [mobilesArray mutableCopy];
        
    }
    
    return speaker;
    
}

-(NSMutableArray*)findAll{
    
    NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM Speaker"];
    
    FMResultSet *rs=[connection excuteQuery:querySQL];
    
    NSMutableArray *result=[NSMutableArray new];
    
    while ([rs next]) {
        
        JETSSpeaker *speaker=[JETSSpeaker new];
        
        speaker.id = [rs longForColumn:@"id"];
        speaker.gender = [rs stringForColumn:@"gender"];
        speaker.imageURL = [rs stringForColumn:@"imageURL"];
        speaker.middleName = [rs stringForColumn:@"middleName"];
        speaker.biography = [rs stringForColumn:@"biography"];
        speaker.firstName = [rs stringForColumn:@"firstName"];
        speaker.lastName = [rs stringForColumn:@"lastName"];
        speaker.companyName = [rs stringForColumn:@"companyName"];
        speaker.title = [rs stringForColumn:@"title"];
        
        NSString *phonesString = [rs stringForColumn:@"phones"];
        NSString *mobilesString = [rs stringForColumn:@"mobiles"];
        
        NSMutableArray *phonesArray =[NSMutableArray arrayWithArray:[phonesString componentsSeparatedByString:@","]];
        NSMutableArray *mobilesArray =[NSMutableArray arrayWithArray:[mobilesString componentsSeparatedByString:@","]];
        
        speaker.phones = [phonesArray mutableCopy];
        speaker.mobiles = [mobilesArray mutableCopy];
        
        [result addObject:speaker];
        
    }
    
    return result;
    
}

-(int)count{
    
    //prefered with agregate function to give the column alias
    NSString *querySQL = [NSString stringWithFormat:@"SELECT COUNT(*) as count_ FROM Speaker"];
    
    FMResultSet *rs = [connection excuteQuery:querySQL];
    
    int count=0;
    
    while ([rs next]) {
        count = [rs intForColumn:@"count_"];
    }
    
    return count;
    
}

-(void)removeALL{
    
    NSString *deleteSQL = [NSString stringWithFormat:@"Delete FROM Speaker"];
    
    [connection excuteUpdate:deleteSQL];
    
}

@end
