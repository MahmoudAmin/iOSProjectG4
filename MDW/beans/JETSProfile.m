//
//  JETSProfile.m
//  ProjectBeans
//
//  Created by JETS on 4/3/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSProfile.h"

@implementation JETSProfile

-(id)initWithId:(long)id_ birthDate:(NSString *)birthDate_ code:(NSString *)code_ imageURL:(NSString *)imageURL_ middleName:(NSString *)middleName_ gender:(NSString *)gender_ firstName:(NSString *)firstName_ email:(NSString *)email_ lastName:(NSString *)lastName_ countryName:(NSString *)countryName_ cityName:(NSString *)cityName_ title:(NSString *)title_ phones:(NSMutableArray *)phones_ mobiles:(NSMutableArray *)mobiles_
{
    
    self = [super init];
    if (self) {
        self.id = id_;
        self.birthDate = birthDate_;
        self.code = code_;
        self.imageURL = imageURL_;
        self.middleName = middleName_;
        self.gender = gender_;
        self.firstName = firstName_;
        self.email = email_;
        self.lastName = lastName_;
        self.countryName = countryName_;
        self.cityName = cityName_;
        self.title = title_;
        self.phones = [phones_ mutableCopy];
        self.mobiles = [mobiles_ mutableCopy];
    }
    return self;
    
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.firstName forKey:@"firstName"];
    [coder encodeObject:self.birthDate forKey:@"birthDate"];
    [coder encodeObject:self.code forKey:@"code"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.imageURL forKey:@"imageURL"];
    [coder encodeObject:self.middleName forKey:@"middleName"];
    [coder encodeObject:self.email forKey:@"email"];
    [coder encodeObject:self.countryName forKey:@"countryName"];
    [coder encodeObject:self.cityName forKey:@"cityName"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.firstName = [coder decodeObjectForKey:@"firstName"];
        self.birthDate = [coder decodeObjectForKey:@"birthDate"];
        self.code = [coder decodeObjectForKey:@"code"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.imageURL = [coder decodeObjectForKey:@"imageURL"];
        self.middleName = [coder decodeObjectForKey:@"middleName"];
        self.email = [coder decodeObjectForKey:@"email"];
        self.countryName = [coder decodeObjectForKey:@"countryName"];
        self.cityName = [coder decodeObjectForKey:@"cityName"];
    }
    return self;
}

@end
