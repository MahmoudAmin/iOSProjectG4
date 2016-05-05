//
//  JETSProfile.h
//  ProjectBeans
//
//  Created by JETS on 4/3/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSProfile : NSObject<NSCoding>

@property long id;
@property NSString *birthDate;
@property NSString *code;
@property NSString *imageURL;
@property NSString *middleName;
@property NSString *gender;
@property NSString *firstName;
@property NSString *email;
@property NSString *lastName;
@property NSString *countryName;
@property NSString *cityName;
@property NSString *title;
@property NSMutableArray *phones;
@property NSMutableArray *mobiles;

-(id)initWithId:(long)id_ birthDate:(NSString *)birthDate_ code:(NSString *)code_ imageURL:(NSString *)imageURL_ middleName:(NSString *)middleName_ gender:(NSString *)gender_ firstName:(NSString *)firstName_ email:(NSString *)email_ lastName:(NSString *)lastName_ countryName:(NSString *)countryName_ cityName:(NSString *)cityName_ title:(NSString *)title_ phones:(NSMutableArray *)phones_ mobiles:(NSMutableArray *)mobiles_;


@end


