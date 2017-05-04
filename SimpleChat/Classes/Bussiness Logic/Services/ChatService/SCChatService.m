//
//  SCChatService.m
//  SimpleChat
//
//  Created by kharitserg on 04.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "SCChatService.h"
#import "SCMessage.h"

@implementation SCChatService

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (SCMessage *)firstMessage{
    SCMessage *message = [[SCMessage alloc] init];
    [self interlocutorsMessage:message withText:@"Have we met before?"];
    return message;
}

- (SCMessage *)noAnswerMessage{
    SCMessage *message = [[SCMessage alloc] init];
    [self interlocutorsMessage:message withText:@"No answer.\nCan i help You?"];
    return message;
}

- (SCMessage *)yesAnswerMessage{
    SCMessage *message = [[SCMessage alloc] init];
    [self interlocutorsMessage:message withText:@"Yes answer.\nCan i help You?"];
    return message;
}

- (SCMessage *)noMessage{
    SCMessage *message = [[SCMessage alloc] init];
    [self meMessage:message withText:@"No, not yet"];
    return message;
}

- (SCMessage *)yesMessage{
    SCMessage *message = [[SCMessage alloc] init];
    [self meMessage:message withText:@"Yes"];
    return message;
}

- (void)interlocutorsMessage:(SCMessage *)message withText:(NSString *)text{
    message.messageType = MessageTypeInterlocutor;
    message.author = @"Dr. Sinclair";
    message.text = text;
    message.timestamp = [[NSNumber alloc] initWithDouble:[[NSDate date] timeIntervalSince1970]];
}

- (void)meMessage:(SCMessage *)message withText:(NSString *)text{
    message.messageType = MessageTypeMe;
    message.author = @"Me";
    message.text = text;
    message.timestamp = [[NSNumber alloc] initWithDouble:[[NSDate date] timeIntervalSince1970]];
}

@end
