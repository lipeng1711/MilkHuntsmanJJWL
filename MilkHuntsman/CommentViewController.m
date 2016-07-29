//
//  CommentViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentTableViewCell.h"
#import "CommentRequest.h"
#import "CommentModel.h"

#import "FamilyViewController.h"

@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *commentTableView;

@property (nonatomic, strong) NSMutableArray *commentArray;


@end

@implementation CommentViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.commentTableView reloadData];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    [milk hiddenTabBar];
}

//显示tabbar
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk showTabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.commentArray = [NSMutableArray array];
  //重新注册cell
    [self.commentTableView registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CommentTableViewCell_Identify];
    
    self.navigationItem.title = @"全部评价";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction:)];
    
 //使用属性传值给出ID.
    
    [self requestCommentDataWith:self.strID];
    
}

//实现左按钮方法
- (void)leftAction:(UIBarButtonItem *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

//解析数据
- (void)requestCommentDataWith:(NSString *)ID{
    __weak typeof(self) weakSelf = self;
    [[CommentRequest shareCommentRequest] commentRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        weakSelf.commentArray = [CommentModel parseCommentWithDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
           //刷新UI                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
            [weakSelf.commentTableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}


//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//返回每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentArray.count;
}

//返回每行的单元格cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CommentTableViewCell_Identify forIndexPath:indexPath];
    
    CommentModel *model = self.commentArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

//返回每行的单元格cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentModel *model = self.commentArray[indexPath.row];
    CommentTableViewCell *mycell = [CommentTableViewCell new];
    CGFloat height = [mycell getHeight:model];

    return height + 130;
}

//cell的预设高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
