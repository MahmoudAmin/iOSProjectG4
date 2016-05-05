//
//  JETSAbstractModel.h
//  Database1
//
//  Created by Mahmoud Amin on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//
#import <Foundation/Foundation.h>

@protocol JETSAbstractModel <NSObject>
@required
-(void)createBean:(id)bean;
-(void)removeBean:(id)bean;
-(id)findById:(id)id_;
-(NSMutableArray*)findAll;
-(int)count;
-(void)removeALL;
@optional
-(id)findByDate:(id)date_;
-(void)editBean:(id)bean;
@end

