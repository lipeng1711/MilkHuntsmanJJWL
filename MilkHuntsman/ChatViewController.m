//
//  ChatViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/22.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "ChatViewController.h"
#import "ImageFromTableViewCell.h"
#import "ImageToTableViewCell.h"
@interface ChatViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
EMChatManagerDelegate,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;

@property(nonatomic,strong)UITextView *msgTextView;

@property(nonatomic,strong)NSMutableArray *msgArr;

@property(nonatomic,strong)NSString *username;

@property(nonatomic,strong)UIImage *image;

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
    
    [self.chatTableView registerNib:[UINib nibWithNibName:@"ImageFromTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ImageFromTableViewCell_Identify];
    
    [self.chatTableView registerNib:[UINib nibWithNibName:@"ImageToTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ImageToTableViewCell_Identify];
    
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
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(50, self.view.bounds.size.height - 45, self.view.bounds.size.width - 160, 40)];
    textView.backgroundColor = [UIColor colorWithRed:53 / 255.0 green:191 / 255.0 blue:212 / 255.0 alpha:1];
    [self.view addSubview:textView];
    self.msgTextView = textView;
    UIButton *sendBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    sendBtn.frame = CGRectMake(self.view.bounds.size.width - 65, self.view.bounds.size.height - 50, 75, 50);
    [sendBtn setTitle:@"发送" forState:(UIControlStateNormal)];
    [sendBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [sendBtn addTarget:self action:@selector(sendMessage:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:sendBtn];
    sendBtn.backgroundColor = [UIColor clearColor];
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    photoBtn.frame = CGRectMake(self.view.bounds.size.width - 100, self.view.bounds.size.height - 50, 47, 47);
    [photoBtn setBackgroundImage:[UIImage imageNamed:@"tianjia.png"] forState:(UIControlStateNormal)];
    [photoBtn addTarget:self action:@selector(photoAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:photoBtn];
    
    UIButton *talkBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    talkBtn.frame = CGRectMake(5, self.view.bounds.size.height - 45, 50, 50);
    [talkBtn setBackgroundImage:[UIImage imageNamed:@"yuyin2.png"] forState:(UIControlStateNormal)];
    //    [talkBtn addTarget:self action:@selector(talkAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:talkBtn];
}
//发送图片按钮
- (void)photoAction:(UIButton *)btn{
    //调用相册，获取图片
    UIImagePickerController *imageVC = [[UIImagePickerController alloc] init];
    imageVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imageVC.allowsEditing = YES;
    imageVC.delegate = self;
    [self presentViewController:imageVC animated:YES completion:nil];
}
//调用相册的代理方法--->选取完照片之后执行的动作
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    __weak typeof (self) weakSelf=self;
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
    //讲照片转换为NSData类型
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    //创建包体和发送者
    EMImageMessageBody *imageBody = [[EMImageMessageBody alloc] initWithData:data displayName:@"image.png"];
    NSString *from = [[EMClient sharedClient] currentUsername];
    //生成Message
    EMMessage *message = [[EMMessage alloc] initWithConversationID:self.userName from:from to:self.userName body:imageBody ext:nil];
    message.chatType = EMChatTypeChat;// 设置为单聊消息
    //点击发送，调用环信方法
    [[EMClient sharedClient].chatManager asyncSendMessage:message progress:nil completion:^(EMMessage *aMessage, EMError *aError) {
        //将数据加入到数组
        [weakSelf.msgArr addObject:aMessage];
        //主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.chatTableView reloadData];
            //调用方法
            [self scrollviewToBottom];
            //清空发送的image
            // self.image=nil;
        });
    }];
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
    switch (msgBody.type) {
        case EMMessageBodyTypeText:{
            //收到的是文字消息
            EMTextMessageBody *textBody = (EMTextMessageBody *)msgBody;
            NSString *txt = textBody.text;
            //发送方
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
            break;
        }
        case EMMessageBodyTypeImage:{
            // 得到一个图片消息
            EMImageMessageBody *body = ((EMImageMessageBody *)msgBody);
            NSString *path= body.localPath;//图片在本地的路径
            //发送方
            if (message.direction == EMMessageDirectionSend) {
                ImageFromTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageFromTableViewCell_Identify forIndexPath:indexPath];
                
                cell.fromImage.image = [UIImage imageWithContentsOfFile:path];
                
                return cell;
            }else{
                //接收方
                ImageToTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageToTableViewCell_Identify forIndexPath:indexPath];
                //服务器上的路径，因为是别人给你发的，所以必须获取到服务器路径
                NSString *str = body.remotePath;
                NSURL *url = [NSURL URLWithString:str];
                NSData *data = [NSData dataWithContentsOfURL:url];
                cell.toImage.image = [UIImage imageWithData:data];
                return cell;
            }
            break;
        }
        default:{
            return nil;
        }
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

    //取出数组元素
    EMMessage *message = _msgArr[indexPath.row];
    EMMessageBody *messageBody = message.body;
    //判断包体里面的数据类型
    switch (messageBody.type) {
            //文本消息
        case EMMessageBodyTypeText:{
            //发送者
            if (message.direction == EMMessageDirectionSend) {
                return self.height+50;
            }
            //图片消息
        case EMMessageBodyTypeImage:{
            //发送者
            if (message.direction == EMMessageDirectionSend) {
                return 157;
            }else{
                return 142;
            }
            break;
        }
        default:{
            return 150;
        }
        }
    }
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
