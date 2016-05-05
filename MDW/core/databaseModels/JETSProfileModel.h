//
//  JETSProfileModel.h
//  Database1
//
//  Created by Mahmoud Amin on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JETSProfile.h"

@interface JETSProfileModel : NSObject
-(void)createProfile:(JETSProfile*)profile;
-(JETSProfile*)getProfile;
-(void)removeProfile;
@end
