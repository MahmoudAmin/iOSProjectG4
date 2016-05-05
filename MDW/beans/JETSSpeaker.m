//
//  JETSSpeaker.m
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSSpeaker.h"

@implementation JETSSpeaker

-(id)initWithId:(long)id_ gender:(NSString *)gender_ imageURL:(NSString *)imageURL_ middleName:(NSString *)middleName_ biography:(NSString *)biography_ firstName:(NSString *)firstName_ lastName:(NSString *)lastName_ companyName:(NSString *)companyName_ title:(NSString *)title_ phones:(NSMutableArray *)phones_ mobiles:(NSMutableArray *)mobiles_
{
    
    self = [super init];
    if (self) {
        self.id = id_;
        self.gender = gender_;
        self.imageURL = imageURL_;
        self.middleName = middleName_;
        self.biography = biography_;
        self.firstName = firstName_;
        self.lastName = lastName_;
        self.companyName = companyName_;
        self.title = title_;
        self.phones = [phones_ mutableCopy];
        self.mobiles = [mobiles_ mutableCopy];
    }
    return self;
    
}

@end
