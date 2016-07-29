//
//  RecommendSearchViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/18.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendSearchViewController.h"
#import "RecommendRequest.h"
#import "RecommendSearchBarTableViewController.h"

@interface RecommendSearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *searchList;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation RecommendSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _searchList = [NSMutableArray array];
    _dataArray = [NSMutableArray array];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemCancel) target:self action:@selector(leftAction)];
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WindownWidth, WindowHeight - 64) style:(UITableViewStylePlain)];
    [self.view addSubview:self.tableview];
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"list"];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    [self request];
    
}

- (void)leftAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addAllViews];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    [GiFHUD show];
    [milk hiddenTabBar];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [GiFHUD dismiss];
}

- (void)addAllViews
{
    
    self.view.backgroundColor = [UIColor colorWithRed:0.936 green:0.941 blue:0.936 alpha:1.000];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.164 green:0.657 blue:0.915 alpha:1.000]];
    self.navigationItem.title = @"热门搜索";
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    //设置UISearchController的显示属性，以下3个属性默认为YES
    //搜索时，背景变暗色
    self.searchController.dimsBackgroundDuringPresentation = NO;
    //搜索时，背景变模糊
    self.searchController.obscuresBackgroundDuringPresentation = NO;
    //隐藏导航栏
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    //设置搜索栏的位置
    self.searchController.searchBar.frame = CGRectMake(0, 0, WindownWidth, 44);
    
    self.tableview.tableHeaderView = self.searchController.searchBar;

    self.searchController.searchResultsUpdater = self;
    
}

- (void)request
{
    __weak typeof(self) weakSelf = self;
    [[RecommendRequest shareRecommendRequest] recommendRequestListWithParameter:nil success:^(NSDictionary *dic) {
        for (NSString *str in dic[@"data"]) {
            [weakSelf.dataArray addObject:str];
        }
        
//        NSLog(@"arr = %@",_dataArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableview reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.searchController.searchBar removeFromSuperview];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk showTabBar];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (self.searchController.active) {
        return [self.searchList count];
    }else{
        return [self.dataArray count];
    }
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    //过滤数据
    self.searchList= [NSMutableArray arrayWithArray:[_dataArray filteredArrayUsingPredicate:preicate]];
    //刷新表格
    [self.tableview reloadData];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"list" forIndexPath:indexPath];
    if (self.searchController.active) {
        [cell.textLabel setText:self.searchList[indexPath.row]];
        
    }
    else{
        [cell.textLabel setText:self.dataArray[indexPath.row]];
    }

    
    return cell;
}
#pragma mark -- cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendSearchBarTableViewController *searchVC = [RecommendSearchBarTableViewController new];
    searchVC.titleString = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self.navigationController pushViewController:searchVC animated:YES];
    
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
