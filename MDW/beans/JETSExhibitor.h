//
//  JETSExhibitor.h
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSExhibitor : NSObject

@property long id;
@property NSString *imageURL;
@property NSString *companyAddress;
@property NSString *companyAbout;
@property NSString *fax;
@property NSString *contactName;
@property NSString *contactTitle;
@property NSString *companyUrl;
@property NSString *email;
@property NSString *countryName;
@property NSString *cityName;
@property NSString *companyName;
@property NSMutableArray *phones;
@property NSMutableArray *mobiles;

-(id)initWithId:(long)id_ imageURL:(NSString *)imageURL_ companyAddress:(NSString *)companyAddress_ companyAbout:(NSString *)companyAbout_ fax:(NSString *)fax_ contactName:(NSString *)contactName_ contactTitle:(NSString *)contactTitle_ companyUrl:(NSString *)companyUrl_ email:(NSString *)email_ countryName:(NSString *)countryName_ cityName:(NSString *)cityName_ companyName:(NSString *)companyName_ phones:(NSMutableArray *)phones_ mobiles:(NSMutableArray *)mobiles_;

@end
