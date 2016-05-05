//
//  DateHelper.m
//  MDW
//
//  Created by Mahmoud Ahmed Amin on 5/4/16.
//  Copyright © 2016 Mahmoud Amin. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper
-(NSString*)difrenceBetweenStartDate:(long) start EndDate:(long)end{
    start/=1000;
    end/=1000;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSDate * startDate = [NSDate dateWithTimeIntervalSinceReferenceDate:start];
    NSDate * endDate = [NSDate dateWithTimeIntervalSinceReferenceDate:end];

    return [NSString stringWithFormat:@"%@ - %@",[dateFormatter stringFromDate:startDate],[dateFormatter stringFromDate:endDate]];
}
-(NSString*)getDaynmber:(long)startDate{
    startDate/=1000;
    NSDate * start = [NSDate dateWithTimeIntervalSinceReferenceDate:startDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd"];
    return [dateFormatter stringFromDate:start];
}
-(NSString*)representDate:(long)startDate{
    startDate/=1000;
    NSDate * start = [NSDate dateWithTimeIntervalSinceReferenceDate:startDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    return [dateFormatter stringFromDate:start];
}
@end
