//
//  JETSProfileModel.m
//  Database1
//
//  Created by Mahmoud Amin on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import "JETSProfileModel.h"

@implementation JETSProfileModel
-(void)createProfile:(JETSProfile*)profile{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:profile];
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:@"JETSUserProfile"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(JETSProfile*)getProfile{
    NSData *encodedObject=[[NSUserDefaults standardUserDefaults] objectForKey:@"JETSUserProfile"];
    JETSProfile *profile=[NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return profile;
    
}
-(void)removeProfile{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JETSUserProfile"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end