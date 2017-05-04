//
//  SCChatViewController.m
//  SimpleChat
//
//  Created by kharitserg on 03.05.17.
//  Copyright © 2017 Kharitonov. All rights reserved.
//

#import "SCChatViewController.h"
#import "SCMessage.h"
#import "SCChatInterlocutorTableViewCell.h"
#import "SCChatMeTableViewCell.h"

NSInteger const AnswersButtonBottomEdgeWhenShow = 35;
NSInteger const AnswersButtonHeight = 50;
NSInteger const AnswersButtonTopEdge = 20;

@interface SCChatViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *chatsMessages;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *answerButtons;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *answersButtonsBottomLayoutConstraint;
@property (strong, nonatomic) UIView *headerView;

@end

@implementation SCChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (void)configure{
    self.chatsMessages = [NSMutableArray array];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-20-AnswersButtonBottomEdgeWhenShow-AnswersButtonHeight-AnswersButtonTopEdge)];
    [self.tableView setTableHeaderView:view];
    self.headerView = view;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self generateFirstMessage];
}

- (void)generateFirstMessage{
    [self.chatsMessages addObject:[self.chatService firstMessage]];
    [self updateMessages];
    [self showButtons];
}

- (void)updateMessages{
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:([self.chatsMessages count]-1) inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
    [UIView animateWithDuration:0.3 animations:^{
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:([self.chatsMessages count]) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    } completion:^(BOOL finished) {
        CGRect newFrame = self.headerView.frame;
        newFrame.size.height = SCREEN_HEIGHT-20-AnswersButtonBottomEdgeWhenShow-AnswersButtonHeight-AnswersButtonTopEdge;
        int x = 0;
        for (UITableViewCell *cell in self.tableView.visibleCells) {
            if (x == [self.tableView.visibleCells count]-1) {
                break;
            }
            newFrame.size.height -= cell.frame.size.height;
            x++;
        }
        if (newFrame.size.height < 0) {
            newFrame.size.height = 0;
        }
        [self.headerView setFrame:newFrame];
        [self.tableView setTableHeaderView:self.headerView];
    }];
    
}

- (void)showButtons{
    
    [self.answersButtonsBottomLayoutConstraint setConstant:AnswersButtonBottomEdgeWhenShow];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)setButtonsEnable{
    for (UIButton *btn in self.answerButtons) {
        [btn setEnabled:YES];
    }
}

#pragma UITableView and UIScrollView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.chatsMessages count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier;
    if ([self.chatsMessages count] != indexPath.row) {
        SCMessage *message = [self.chatsMessages objectAtIndex:indexPath.row];
        if (message.messageType == MessageTypeInterlocutor) {
            reuseIdentifier = InterlocutorCellIdentifier;
        }else{
            reuseIdentifier = MeCellIdentifier;
        }
    }else{
        reuseIdentifier = @"emptyCell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier
                                                            forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.chatsMessages count] != indexPath.row) {
        SCMessage *message = [self.chatsMessages objectAtIndex:indexPath.row];
        if (message.messageType == MessageTypeInterlocutor) {
            SCChatInterlocutorTableViewCell *chatCell = (SCChatInterlocutorTableViewCell *)cell;
            chatCell.authorLabel.text = message.author;
            chatCell.messageLabel.text = message.text;
        }else{
            SCChatMeTableViewCell *chatCell = (SCChatMeTableViewCell *)cell;
            chatCell.authorLabel.text = message.author;
            chatCell.messageLabel.text = message.text;
        }
    }
}

#pragma mark Actions

- (IBAction)answerButtonTapped:(UIButton *)sender {
    for (UIButton *btn in self.answerButtons) {
        [btn setEnabled:NO];
    }
    SCMessage *message;
    SCMessage *answerMessage;
    switch (sender.tag) {
        case 0:
            message = [self.chatService noMessage];
            answerMessage = [self.chatService noAnswerMessage];
            break;
        default:
            message = [self.chatService yesMessage];
            answerMessage = [self.chatService yesAnswerMessage];
            break;
    }
    [self.chatsMessages addObject:message];
    [self updateMessages];
    [self.chatsMessages addObject:answerMessage];
    [self performSelector:@selector(updateMessages) withObject:nil afterDelay:1.0];
    [self performSelector:@selector(setButtonsEnable) withObject:nil afterDelay:1.0];
}


@end
