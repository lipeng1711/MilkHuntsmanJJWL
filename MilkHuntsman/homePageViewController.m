//
//  homePageViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/19.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "homePageViewController.h"
#import "homePageTableViewCell.h"
#import "HomePageRequest.h"
#import "CommentTableViewCell.h"
#import "ChatViewController.h"

@interface homePageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//头部视图
@property (weak, nonatomic) IBOutlet UIView *headerView;
//关注按钮
@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;
//发私信按钮  托方法
@property (weak, nonatomic) IBOutlet UIButton *sendMessageBtn;
//trips数组
@property (nonatomic, strong) NSMutableArray *homePageArray;

@end

@implementation homePageViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.29 green:0.74 blue:0.80 alpha:1.000]];
    self.userImageV.layer.masksToBounds = YES;
    self.userImageV.layer.cornerRadius = self.userImageV.bounds.size.width / 2.0;

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homePageArray = [NSMutableArray array];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"homePageTableViewCell" bundle:[NSBundle mainBundle]]forCellReuseIdentifier:@"homeCell"];
    
    self.tableView.tableHeaderView = self.headerView;
    
    self.headerView.frame = CGRectMake(0, 0, 0, 220);
    
    [self requestHomePageRequest:self.passValueID];
    
    [self requestUserInfoRequest:self.passValueID];
    
}

////数组转字符串
//- (NSString *)getStrFromArray:(NSArray *)arr{
//    NSMutableString *mStr = [NSMutableString new];
//    for (NSString *str in arr) {
//        [mStr appendString:str];
//    }
//    return mStr;
//}

//关注按钮的方法
- (IBAction)attentionBtn:(UIButton *)sender {
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef,(CGFloat[]){1,0,0,1});
    [sender.layer setBorderColor:color];               
    [sender setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [self.headerView addSubview:sender];
    
    BOOL result = [self.attentionBtn.titleLabel.text isEqual: @"已关注"];
    if (result) {
        [sender setTitle:@"关注" forState:(UIControlStateNormal)];
    }else{
        [sender setTitle:@"已关注" forState:(UIControlStateNormal)];
    }
}

//发私信按钮的方法
- (IBAction)sendMessageBtn:(UIButton *)sender {
    
}


//解析trips数据
- (void)requestHomePageRequest:(NSString *)ID{
    __weak typeof(self) weakSelf = self;
    [[HomePageRequest shareHomePageRequest] homePageRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        weakSelf.homePageArray = [HomePageModel parseHomePageWithDic:dic];
       
        dispatch_async(dispatch_get_main_queue(), ^{
          //刷新UI
            [weakSelf.tableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];

}

//解析用户user_info数据
- (void)requestUserInfoRequest:(NSString *)ID{
    
    __weak typeof(self) weakSelf = self;
    [[HomePageRequest shareHomePageRequest] homePageRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic){
        HomeUserInfoModel *model = [HomeUserInfoModel parseHomePageHeadDic:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
#pragma mark ======= block中先走主线程的内容,然后实现回调,这里是给头部视图赋值 ==============
            weakSelf.userNameLabel.text = model.name;
            [weakSelf.userImageV setImageWithURL:[NSURL URLWithString:model.avatar_m]];
            [weakSelf.backGroundImageV setImageWithURL:[NSURL URLWithString:model.cover]];
            weakSelf.fansLabel.text = [NSString stringWithFormat:@"%@",model.followers_count];
            weakSelf.attentionLabel.text = [NSString stringWithFormat:@"%@",model.points];
        
            [weakSelf.tableView setTableHeaderView:weakSelf.headerView]; //这里在主线程需要再添加头视图才行
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}


//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
    
}

//返回分区数中包含的cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.homePageArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        homePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
        
        HomePageModel *model = self.homePageArray[indexPath.row];
        
        cell.homePageModel = model;
        
        return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 240;
    
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
