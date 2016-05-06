//
//  JETSExhibitorModel.m
//  Database1
//
//  Created by JETS on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSExhibitorModel.h"

@implementation JETSExhibitorModel

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        connection=[JETSDBConnectionFactory getInstance];
        
    }
    
    return self;
    
}

-(void)createBean:(id)bean{
    
    JETSExhibitor *exhibitor=(JETSExhibitor *) bean;
    
    NSString *insertSQL = [NSString stringWithFormat:
                           @"INSERT INTO Exhibitor (id, imageURL, companyAddress, companyAbout, fax, contactName, contactTitle, companyUrl, email, countryName, cityName, companyName, phones, mobiles) VALUES (%ld, '%@', '%@', \"%@\", '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')",
                           exhibitor.id, exhibitor.imageURL, exhibitor.companyAddress, exhibitor.companyAbout, exhibitor.fax, exhibitor.contactName, exhibitor.contactTitle, exhibitor.companyUrl, exhibitor.email, exhibitor.countryName, exhibitor.cityName, exhibitor.companyName, [exhibitor.phones componentsJoinedByString:@","], [exhibitor.mobiles componentsJoinedByString:@","]];
    
    [connection excuteUpdate:insertSQL];
    
}

-(void)removeBean:(id)bean{
    
    JETSExhibitor *exhibitor=(JETSExhibitor *) bean;
    
    NSString *deleteSQL = [NSString stringWithFormat:@"Delete FROM Exhibitor WHERE id=%ld",exhibitor.id];
    
    [connection excuteUpdate:deleteSQL];
    
}

-(id)findById:(id)id_{
    
    long myId=(long)id_;
    
    NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM Exhibitor WHERE id=%ld",myId];
    
    FMResultSet *rs=[connection excuteQuery:querySQL];
    
    JETSExhibitor *exhibitor=[JETSExhibitor new];
    
    while ([rs next]) {
        
        exhibitor.id = [rs longForColumn:@"id"];
        exhibitor.imageURL = [rs stringForColumn:@"imageURL"];
        exhibitor.companyAddress = [rs stringForColumn:@"companyAddress"];
        exhibitor.companyAbout = [rs stringForColumn:@"companyAbout"];
        exhibitor.fax = [rs stringForColumn:@"fax"];
        exhibitor.contactName = [rs stringForColumn:@"contactName"];
        exhibitor.contactTitle = [rs stringForColumn:@"contactTitle"];
        exhibitor.companyUrl = [rs stringForColumn:@"companyUrl"];
        exhibitor.email = [rs stringForColumn:@"email"];
        exhibitor.countryName = [rs stringForColumn:@"countryName"];
        exhibitor.cityName = [rs stringForColumn:@"cityName"];
        exhibitor.companyName = [rs stringForColumn:@"companyName"];
        
        //mutable array can be init with normal array
        NSMutableArray *phonesArray =[NSMutableArray arrayWithArray:[[rs stringForColumn:@"phones"] componentsSeparatedByString:@","]];
        NSMutableArray *mobilesArray =[NSMutableArray arrayWithArray:[[rs stringForColumn:@"mobiles"] componentsSeparatedByString:@","]];
        
        exhibitor.phones = [phonesArray mutableCopy];
        exhibitor.mobiles = [mobilesArray mutableCopy];
        
    }
    
    return exhibitor;
    
}

-(NSMutableArray*)findAll{
    
    NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM Exhibitor"];
    
    FMResultSet *rs=[connection excuteQuery:querySQL];
    
    NSMutableArray *result=[NSMutableArray new];
    
    while ([rs next]) {
        
        JETSExhibitor *exhibitor=[JETSExhibitor new];
        
        exhibitor.id = [rs longForColumn:@"id"];
        exhibitor.imageURL = [rs stringForColumn:@"imageURL"];
        exhibitor.companyAddress = [rs stringForColumn:@"companyAddress"];
        exhibitor.companyAbout = [rs stringForColumn:@"companyAbout"];
        exhibitor.fax = [rs stringForColumn:@"fax"];
        exhibitor.contactName = [rs stringForColumn:@"contactName"];
        exhibitor.contactTitle = [rs stringForColumn:@"contactTitle"];
        exhibitor.companyUrl = [rs stringForColumn:@"companyUrl"];
        exhibitor.email = [rs stringForColumn:@"email"];
        exhibitor.countryName = [rs stringForColumn:@"countryName"];
        exhibitor.cityName = [rs stringForColumn:@"cityName"];
        exhibitor.companyName = [rs stringForColumn:@"companyName"];
        
        //mutable array can be init with normal array
        NSMutableArray *phonesArray =[NSMutableArray arrayWithArray:[[rs stringForColumn:@"phones"] componentsSeparatedByString:@","]];
        NSMutableArray *mobilesArray =[NSMutableArray arrayWithArray:[[rs stringForColumn:@"mobiles"] componentsSeparatedByString:@","]];
        
        exhibitor.phones = [phonesArray mutableCopy];
        exhibitor.mobiles = [mobilesArray mutableCopy];
        
        [result addObject:exhibitor];
        
    }
    
    return result;
    
}

-(int)count{
    
    //prefered with agregate function to give the column alias
    NSString *querySQL = [NSString stringWithFormat:@"SELECT COUNT(*) as count_ FROM Exhibitor"];
    
    FMResultSet *rs = [connection excuteQuery:querySQL];
    
    int count=0;
    
    while ([rs next]) {
        count = [rs intForColumn:@"count_"];
    }
    
    return count;
    
}

-(void)removeALL{
    
    NSString *deleteSQL = [NSString stringWithFormat:@"Delete FROM Exhibitor"];
    
    [connection excuteUpdate:deleteSQL];
    
}

@end
