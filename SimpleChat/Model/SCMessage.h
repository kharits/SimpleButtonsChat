//
//  SCMessage.h
//  SimpleChat
//
//  Created by kharitserg on 03.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    MessageTypeInterlocutor,
    MessageTypeMe
} MessageType;

/**
 Object for saving Message's data
 */
@interface SCMessage : NSObject

@property (nonatomic) MessageType messageType;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSNumber *timestamp;
@property (nonatomic, strong) NSString *text;

@end
