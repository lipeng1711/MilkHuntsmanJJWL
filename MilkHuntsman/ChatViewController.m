//
//  ChatViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate,EMChatManagerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;

@property(nonatomic,strong)UITextView *msgTextView;

@property(nonatomic,strong)NSMutableArray *msgArr;

@property(nonatomic)CGFloat height;

@end

@implementation ChatViewController

- (NSMutableArray *)msgArr{
    
    if (!_msgArr) {
        
        _msgArr = [NSMutableArray new];
        
    }
    
    return _msgArr;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"和%@聊天",self.userName];
    
    [self addSendView];
    
    [self.chatTableView registerNib:[UINib nibWithNibName:@"FromTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
    
    [self.chatTableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"to"];
    
    
    
    //获取或者创建一个会话
    EMConversation *conversation = [[EMClient sharedClient].chatManager getConversation:self.userName type:(EMConversationTypeChat) createIfNotExist:YES];
    //获取聊天消息
    self.msgArr = [conversation loadMoreMessagesContain:nil before:-1 limit:20 from:nil direction:(EMMessageSearchDirectionUp)].mutableCopy;
    
    
    [self.chatTableView reloadData];
    
    [self scrollviewToBottom];
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    
    [[EMClient sharedClient].chatManager removeDelegate:self];
    
}

//输入内容界面
- (void)addSendView{
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(40, self.view.frame.size.height - 50, self.view.frame.size.width - 120, 50)];
    [self.view addSubview:textView];
    self.msgTextView = textView;
    
    UIButton *sendBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    sendBtn.frame = CGRectMake(self.view.frame.size.width - 80, self.view.frame.size.height - 50, 80, 50);
    [sendBtn setTitle:@"发送" forState:(UIControlStateNormal)];
    [sendBtn addTarget:self action:@selector(sendMessage:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:sendBtn];
    
    sendBtn.backgroundColor = [UIColor greenColor];
    textView.backgroundColor = [UIColor cyanColor];
    
}
//发送消息
- (void)sendMessage:(UIButton *)btn{
    __weak typeof (self) weakSelf = self;
    if (self.msgTextView.text.length > 0) {
        EMTextMessageBody *body = [[EMTextMessageBody alloc] initWithText:self.msgTextView.text];
        NSString *from = [[EMClient sharedClient] currentUsername];
        
        //生成Message
        EMMessage *message = [[EMMessage alloc] initWithConversationID:self.userName from:from to:self.userName body:body ext:nil];
        message.chatType = EMChatTypeChat;// 设置为单聊消息
        //message.chatType = EMChatTypeGroupChat;// 设置为群聊消息
        //message.chatType = EMChatTypeChatRoom;// 设置为聊天室消息
        [[EMClient sharedClient].chatManager asyncSendMessage:message progress:nil completion:^(EMMessage *aMessage, EMError *aError) {
            [weakSelf.msgArr addObject:aMessage];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.chatTableView reloadData];
                [weakSelf scrollviewToBottom];
            });
        }];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.msgArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取每行消息
    EMMessage *message = self.msgArr[indexPath.row];
    //获取消息体
    EMMessageBody *msgBody = message.body;
    //获取消息体的内容
    EMTextMessageBody *textBody = (EMTextMessageBody *)msgBody;
    NSString *txt = textBody.text;
    if (message.direction == 0) {
        //发送方
        FromTableViewCell *fromcell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        fromcell.myLabel.text = txt;
        self.height = [fromcell getHeight:txt font:17];
        return fromcell;
    }else{
        ChatTableViewCell *tocell = [tableView dequeueReusableCellWithIdentifier:@"to"];
        tocell.myLabel.text = txt;
        return tocell;
    }
}

//收到消息
- (void)didReceiveMessages:(NSArray *)aMessages{
    for (EMMessage *message in aMessages) {
        //只能正在和你聊天的聊天
        if ([message.conversationId isEqualToString:self.userName] ) {
            [self.msgArr addObject:message];
        }
    }
    [self.chatTableView reloadData];
    [self scrollviewToBottom];
}

- (void)scrollviewToBottom{
    
    if (self.msgArr.count < 1) {
        
        return;
        
    }
    //获取tableview最后一行
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.msgArr.count - 1 inSection:0];
    //滑到最后一行的最下面
    [self.chatTableView scrollToRowAtIndexPath:path atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return self.height+50;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
