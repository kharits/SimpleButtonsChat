//
//  SCChatButton.m
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "SCChatButton.h"

@implementation SCChatButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configure];
    }
    return self;
}

- (void)configure{
    
    [self setBackgroundColor:UIColorFromRGB(0x4f5968)];
    
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor;
    self.layer.shadowOffset = CGSizeMake(-12, 20);
    self.layer.shadowOpacity = 0.2f;
    self.layer.shadowRadius = 0;
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 6;
}

@end
