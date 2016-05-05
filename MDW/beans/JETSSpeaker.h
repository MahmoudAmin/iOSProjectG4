//
//  JETSSpeaker.h
//  ProjectBeans
//
//  Created by JETS on 4/4/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JETSSpeaker : NSObject

@property long id;
@property NSString *gender;
@property NSString *imageURL;
@property NSString *middleName;
@property NSString *biography;
@property NSString *firstName;
@property NSString *lastName;
@property NSString *companyName;
@property NSString *title;
@property NSMutableArray *phones;
@property NSMutableArray *mobiles;

-(id)initWithId:(long)id_ gender:(NSString *)gender_ imageURL:(NSString *)imageURL_ middleName:(NSString *)middleName_ biography:(NSString *)biography_ firstName:(NSString *)firstName_ lastName:(NSString *)lastName_ companyName:(NSString *)companyName_ title:(NSString *)title_ phones:(NSMutableArray *)phones_ mobiles:(NSMutableArray *)mobiles_;

@end
