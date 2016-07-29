//
//  FindViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
#import "FindView.h"
#import "FindRequest.h"
#import "FindModel.h"
#import "WebViewController.h"
#import "CommentViewController.h"
#import "RootViewController.h"
#import "homePageViewController.h"


@interface FindViewController ()
<
  UITableViewDataSource,
  UITableViewDelegate,
  passValueCommentBtnDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *findTableView;

@property (nonatomic, strong) NSMutableArray *findArray;
//用来传值(product_id)用的字符串
@property (nonatomic, strong) NSString *tempStr;

@property (nonatomic, strong) NSString *passHomePageID;

@property (nonatomic, assign) NSInteger section;

@property (assign,nonatomic)BOOL isNight;

@end

//模拟2秒后进行刷新操作
static const CGFloat MJDuration = 1.5;

@implementation FindViewController

//视图加载的时候显示tabBar
- (void)viewWillAppear:(BOOL)animated{
    self.rootVC.milkHuntsmanTabBar.hidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   //重新注册cell
    [self.findTableView registerNib:[UINib nibWithNibName:@"FindTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:FindTableViewCell_Identify];
    
    self.findArray = [NSMutableArray array];
    
    
    [self requestFind];
    
    //下拉刷新  设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置文字
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开进行刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新,请稍后Loading..." forState:MJRefreshStateRefreshing];
    
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置颜色
    header.stateLabel.textColor = [UIColor redColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
    
//     马上进入刷新状态
    [header beginRefreshing];
    
//     设置刷新控件
    self.findTableView.mj_header = header;
    
    //注册观察者,接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeToNight:) name:@"changeToNight" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeToDay:) name:@"changeToDay" object:nil];
}

#pragma mark ======== 夜间模式 (这里能优化) ===============================
- (void)changeToNight:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    self.isNight = [[userInfo objectForKey:@"status"] boolValue];
    if (self.isNight) {
        self.findTableView.backgroundColor = [UIColor blackColor];
        self.findTableView.alpha = 0.9;
        self.view.backgroundColor = [UIColor blackColor];
    }
}

- (void)changeToDay:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    self.isNight = [[userInfo objectForKey:@"statusDay"] boolValue];
    if (!self.isNight) {
        self.findTableView.backgroundColor = [UIColor whiteColor];
        self.findTableView.alpha = 1;
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


//下拉刷新的回调方法
- (void)loadNewData{
    // 模拟1.5秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.findTableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.findTableView.mj_header endRefreshing];
    });
}

//请求解析数据
- (void)requestFind{
    __weak typeof(self) weakSelf = self;
    [[FindRequest shareFindRequest] findRequestWithParameter:nil success:^(NSDictionary *dic) {
        weakSelf.findArray = [FindModel parseFindWithDic:dic];
    dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.findTableView reloadData];
        });     
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}


//点击评论数button的方法
- (void)commentBtnDelegate:(NSString *)string{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    CommentViewController *commentVC = [storyboard instantiateViewControllerWithIdentifier:@"CommentViewController"];
    [self.navigationController pushViewController:commentVC animated:YES];
    
    self.rootVC.milkHuntsmanTabBar.hidden = YES;
  //代理传值
    self.tempStr = string;
  //然后在属性传值
    commentVC.strID = self.tempStr;
}

//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

   
    return self.findArray.count;
}

//返回每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

//添加头部视图
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    FindView *findV = [[FindView alloc] init];
#pragma mark ========= 给头部视图赋值 ==================
    FindModel * model = self.findArray[section];
    [findV.headImageV setImageWithURL:[NSURL URLWithString:model.user[@"avatar_s"]]];
    findV.userName.text = model.user[@"username"];
    findV.timeLabel.text = model.date_added;
    if ([model.category isEqualToString:@"share_product"]) {
        findV.label.text = @"分享活动";
    }else if([model.category isEqualToString:@"spot"]){
        findV.label.text = @"分享故事";
    }else{
        findV.label.text = @"发布活动";
    }
    
    self.passHomePageID = model.user[@"id"];
    
    //给头像添加点击事件手势
    findV.headImageV.userInteractionEnabled = YES;
    [findV.headImageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageAction:)]];

    
    return findV;
}

//跳转到用户详情界面
- (void)headImageAction:(UITapGestureRecognizer *)sender{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    homePageViewController *homePageVC = [storyboard instantiateViewControllerWithIdentifier:@"homePageViewController"];
    //给homepage传值
    // FindModel*model= self.findArray[ [self.findTableView indexPathForSelectedRow].row];
    
    //    homePageVC.passValueID = model.user[@"id"];
    
    homePageVC.passValueID = self.passHomePageID;
    
    [self.navigationController pushViewController:homePageVC animated:YES];
}


//添加尾标题的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}

//添加头部视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 66;
}

//返回每行的单元格cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FindTableViewCell_Identify forIndexPath:indexPath];
   //指定代理人
    cell.btnDelegate = self;

    FindModel *model = self.findArray[indexPath.section];

    cell.findModel = model;
    
    return cell;
}

//返回每行单元格cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 424;
}

//返回cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    WebViewController1 *webVC = [WebViewController1 new];
    [self.navigationController pushViewController:webVC animated:YES];
    
//动态ID传值
    FindModel *model = self.findArray[indexPath.section];
    webVC.passID = model.product_id;
    
//隐藏自定义的tabBar
    self.rootVC.milkHuntsmanTabBar.hidden = YES;
    
//收藏页面的传值
    webVC.model = model;
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
