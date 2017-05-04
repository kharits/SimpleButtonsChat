//
//  SCParentViewController.m
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "SCParentViewController.h"

@interface SCParentViewController ()

@end

@implementation SCParentViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initServices];
    }
    return self;
}

- (void)initServices{
    self.chatService = [SCChatService sharedInstance];
}


@end
