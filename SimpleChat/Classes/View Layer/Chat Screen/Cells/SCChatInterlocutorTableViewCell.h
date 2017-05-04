//
//  SCChatInterlocutorTableViewCell.h
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const InterlocutorCellIdentifier = @"ChatInterlocutorCell";

@interface SCChatInterlocutorTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end
