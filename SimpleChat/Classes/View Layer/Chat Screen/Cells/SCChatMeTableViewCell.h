//
//  SCChatMeTableViewCell.h
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const MeCellIdentifier = @"ChatMeCell";

@interface SCChatMeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end
