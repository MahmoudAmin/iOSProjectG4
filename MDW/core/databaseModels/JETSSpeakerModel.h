//
//  JETSSpeakerModel.h
//  Database1
//
//  Created by Mahmoud Amin on 4/5/16.
//  Copyright (c) 2016 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JETSAbstractModel.h"
#import "JETSDBConnectionFactory.h"
#import "JETSSpeaker.h"

@interface JETSSpeakerModel : NSObject <JETSAbstractModel>{

    JETSDBConnectionFactory *connection;

}

@end
