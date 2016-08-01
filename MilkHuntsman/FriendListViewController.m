//
//  FriendListViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/21.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FriendListViewController.h"

@interface FriendListViewController ()<UITableViewDelegate,UITableViewDataSource,EMContactManagerDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *friendsTableView;
@property(nonatomic,copy)NSString *friendName;
@property(nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation FriendListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    customLab.textAlignment = NSTextAlignmentCenter;
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"好友列表"];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    self.dataArray = [NSMutableArray new];
    
    //注册好友回调
    [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
    
    //移除好友回调
    //    [[EMClient sharedClient].contactManager removeDelegate:self];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加好友" style:(UIBarButtonItemStylePlain) target:self action:@selector(addFriend)];

}
//添加好友
- (void)addFriend{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"添加好友" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"添加账号";
        
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

        EMError *error = [[EMClient sharedClient].contactManager addContact:alert.textFields.lastObject.text message:@"我想加您为好友"];
        if (!error) {
            NSLog(@"添加好友申请成功");
        }else {
            NSLog(@"%@添加失败",error);
        }
        [self requestFriendsList];
    }];

   
    [self presentViewController:alert animated:YES completion:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
}
//获取好友列表
- (void)requestFriendsList{
    [self.dataArray removeAllObjects];
    EMError *error = nil;
    NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
    if (!error) {
        NSLog(@"获取成功 -- %@",userlist);
        [self.dataArray addObjectsFromArray:userlist];
        NSLog(@"好友列表:%@",self.dataArray);
        [self.friendsTableView reloadData];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"friendCell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
//用户同意添加好友后的回调
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername{
    NSLog(@"%@",aUsername);
    [self requestFriendsList];
}
//用户拒绝添加好友后的回调
- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername{
    NSLog(@"%@拒绝我了",aUsername);
}

//好友添加黑名单
- (void)addFriendToBlackListWithUserName:(NSString *)userName{
    EMError *error = [[EMClient sharedClient].contactManager addUserToBlackList:userName relationshipBoth:YES];
    if (!error) {
        NSLog(@"发送成功");
    }
    [self requestFriendsList];
}
//移除黑名单
- (void)removeBlackListWithUserName:(NSString *)userName{
    
    EMError *error = [[EMClient sharedClient].contactManager removeUserFromBlackList:userName];
    if (!error) {
        NSLog(@"发送成功");
    }
    [self requestFriendsList];
}
//别人添加我为好友时执行
- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername
                                       message:(NSString *)aMessage{
    NSLog(@"%@想加我,提示信息是:%@",aUsername,aMessage);
    
    self.friendName = aUsername;
    
    NSString *message = [NSString stringWithFormat:@"%@想加我,提示信息是:%@",aUsername,aMessage];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"好友申请" message:message delegate:self cancelButtonTitle:@"拒绝" otherButtonTitles:@"同意", nil];
    [alert show];
    [self requestFriendsList];
    //    [self.friendsTableView reloadData];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex == 1) {
        //同意
        EMError *error1 = [[EMClient sharedClient].contactManager acceptInvitationForUsername:self.friendName];
        if (!error1) {
            NSLog(@"发送同意成功");
        }
    }else{
        //拒绝
        EMError *error2 = [[EMClient sharedClient].contactManager declineInvitationForUsername:self.friendName];
        if (!error2) {
            NSLog(@"发送拒绝成功");
        }
    }
}
//左滑删除
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
        NSLog(@"点击删除");
        EMError *error = [[EMClient sharedClient].contactManager deleteContact:self.dataArray[indexPath.row]];
        if (!error) {
            NSLog(@"删除成功");
        }
        [self requestFriendsList];
    }];//此处是iOS8.0以后苹果最新推出的api，UITableViewRowAction，Style是划出的标签颜色等状态的定义，这里也可自行定义
    //可以定义RowAction的颜色
    return @[deleteRoWAction];//最后返回这个RowAction 的数组
    
}
//连线传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"chatVC"]) {
        
        ChatViewController *chatVC = (ChatViewController *)segue.destinationViewController;
        
        chatVC.userName = sender;
        
    }
    
}
//点击会话
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *userName = self.dataArray[indexPath.row];
    [self performSegueWithIdentifier:@"chatVC" sender:userName];
    RootViewController *rootVC = (RootViewController *)self.navigationController.parentViewController;
    [rootVC hiddenTabBar];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [self requestFriendsList];
    RootViewController *rootVC = (RootViewController *)self.navigationController.parentViewController;
    [rootVC showTabBar];
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
