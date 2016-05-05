//
//  SessionCell.h
//  MDW
//
//  Created by Mahmoud Ahmed Amin on 5/4/16.
//  Copyright © 2016 Mahmoud Amin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sessionName;
@property (weak, nonatomic) IBOutlet UILabel *sessionPlace;
@property (weak, nonatomic) IBOutlet UILabel *sessionTime;
@property (weak, nonatomic) IBOutlet UILabel *sessionDay;
@property (weak, nonatomic) IBOutlet UIImageView *sessionImage;

@end
