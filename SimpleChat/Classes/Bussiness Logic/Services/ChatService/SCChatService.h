//
//  SCChatService.h
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCMessage;

@interface SCChatService : NSObject

+ (instancetype)sharedInstance;

- (SCMessage *)firstMessage;
- (SCMessage *)noMessage;
- (SCMessage *)noAnswerMessage;
- (SCMessage *)yesMessage;
- (SCMessage *)yesAnswerMessage;

@end
