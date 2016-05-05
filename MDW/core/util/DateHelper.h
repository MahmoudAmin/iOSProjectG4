//
//  DateHelper.h
//  MDW
//
//  Created by Mahmoud Ahmed Amin on 5/4/16.
//  Copyright © 2016 Mahmoud Amin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject
-(NSString*)difrenceBetweenStartDate:(long) start EndDate:(long)end;
-(NSString*)getDaynmber:(long)startDate;
-(NSString*)representDate:(long)startDate;
@end
