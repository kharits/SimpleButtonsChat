//
//  SCParentViewController.h
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCChatService.h"

@interface SCParentViewController : UIViewController

@property (nonatomic, strong) SCChatService *chatService;

@end
