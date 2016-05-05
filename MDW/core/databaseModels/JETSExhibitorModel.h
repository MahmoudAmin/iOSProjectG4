//
//  JETSExhibitorModel.h
//  Database1
//
//  Created by JETS on 4/8/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JETSAbstractModel.h"
#import "JETSDBConnectionFactory.h"
#import "JETSExhibitor.h"

@interface JETSExhibitorModel : NSObject <JETSAbstractModel>{
    
    JETSDBConnectionFactory *connection;
    
}

@end
