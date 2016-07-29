//
//  MessageViewController.m
//  MilkHuntsman
//
//  Created by Hx on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "MessageChatTableViewCell.h"
#import "ChatChatViewController.h"
#import "RootViewController.h"
@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *messageTableView;

@property (nonatomic,strong) RootViewController *rootVC;
@end

@implementation MessageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.rootVC.milkHuntsmanTabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self.messageTableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MessageTableViewCell_ID];
    [self.messageTableView registerNib:[UINib nibWithNibName:@"MessageChatTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MessageChatTableViewCell_ID];
    self.messageTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine ;
    self.messageTableView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00];
    //取到根控制器.
    self.rootVC = (RootViewController *)[[[UIApplication sharedApplication] windows] objectAtIndex:0].rootViewController;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MessageTableViewCell_ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"最新动态";
        }else{
            cell.titleLabel.text = @"系统通知";
        }
        return cell;
    }else{
        MessageChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MessageChatTableViewCell_ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }


    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 0;
    }else{
        return 10;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return;
    }else{
//        [self performSegueWithIdentifier:@"ToChat" sender:nil];
        ChatChatViewController *chatVC = [ChatChatViewController new];
        [self.navigationController pushViewController:chatVC animated:YES];
        //隐藏tabbar
        self.rootVC.milkHuntsmanTabBar.hidden = YES;
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
