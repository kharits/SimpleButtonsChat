//
//  SCChatInterlocutorTableViewCell.m
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "SCChatInterlocutorTableViewCell.h"

@implementation SCChatInterlocutorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.photoImageView.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
