//
//  JETSExhibitor.m
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSExhibitor.h"

@implementation JETSExhibitor

-(id)initWithId:(long)id_ imageURL:(NSString *)imageURL_ companyAddress:(NSString *)companyAddress_ companyAbout:(NSString *)companyAbout_ fax:(NSString *)fax_ contactName:(NSString *)contactName_ contactTitle:(NSString *)contactTitle_ companyUrl:(NSString *)companyUrl_ email:(NSString *)email_ countryName:(NSString *)countryName_ cityName:(NSString *)cityName_ companyName:(NSString *)companyName_ phones:(NSMutableArray *)phones_ mobiles:(NSMutableArray *)mobiles_
{

    self = [super init];
    if (self) {
        self.id = id_;
        self.imageURL = imageURL_;
        self.companyAddress = companyAddress_;
        self.companyAbout = companyAbout_;
        self.fax = fax_;
        self.contactName = contactName_;
        self.contactTitle = contactTitle_;
        self.companyUrl = companyUrl_;
        self.email = email_;
        self.countryName = countryName_;
        self.cityName = cityName_;
        self.companyName = companyName_;
        self.phones = [phones_ mutableCopy];
        self.mobiles = [mobiles_ mutableCopy];
    }
    return self;

}

@end
