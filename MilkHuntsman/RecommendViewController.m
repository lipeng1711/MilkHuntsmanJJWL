//
//  RecommendViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendViewController.h"

#import "RecommendTableViewCell.h"
#import "RecommendView.h"
#import "CityViewController.h"
#import "RecommendRequest.h"
#import "RecommendModel.h"
#import "RecommendSecondTableViewCell.h"
#import "ThirdTableViewCell.h"
#import "FouthTableViewCell.h"
#import "RecommendSearchViewController.h"
#import "MapViewController.h"
#import "RecommendImageViewController.h"
#import "WebViewController.h"
#import "RecommendTwoTableViewCell.h"
#import "RecommendThreeTableViewCell.h"
#import "RecommendFourTableViewCell.h"
#import "RecommendFiveTableViewCell.h"
#import "FifthTableViewCell.h"
#import "RecommendSearchBarModel.h"
#import "RecommendSearchBarTableViewController.h"
#import "HYBModalHalfDetailController.h"
#import "HYBModalTransition.h"

@interface RecommendViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
FirstCellDelegate,
SecondCellDelegate,
ThirdCellDelegate,
ImageViewDelegate,
FirstTwoCellDelegate,
FirstThreeCellDelegate,
FirstFourCellDelegate,
FirstFiveCellDelegate
>

@property (strong, nonatomic) UISearchBar *recommendSearchBar;
@property (strong, nonatomic) UIScrollView *recommendScrollView;
@property (strong, nonatomic) NSMutableArray *buttonArray;
@property (weak, nonatomic) IBOutlet UITableView *recommendTableView;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSMutableArray *threeArr;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSMutableArray *fourArray;
@property (strong, nonatomic) NSMutableArray *rootArray;
@property (nonatomic, strong) HYBModalTransition *transition;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [NSMutableArray array];
    _twoArray = [NSMutableArray array];
    _threeArray = [NSMutableArray array];
    _buttonArray = [NSMutableArray array];
    _imageArray = [NSMutableArray array];
    _threeArr = [NSMutableArray array];
    _fourArray = [NSMutableArray array];
    _rootArray = [NSMutableArray array];
    self.dataArray = [NSMutableArray array];

    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.164 green:0.657 blue:0.915 alpha:1.000]];
    self.recommendTableView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    self.recommendTableView.delegate = self;
    self.recommendTableView.dataSource = self;
    
    [self.recommendTableView registerClass:[RecommendTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.recommendTableView registerClass:[RecommendSecondTableViewCell class] forCellReuseIdentifier:@"second"];
    [self.recommendTableView registerClass:[ThirdTableViewCell class] forCellReuseIdentifier:@"third"];
    [self.recommendTableView registerClass:[FouthTableViewCell class] forCellReuseIdentifier:@"fouth"];
    [self.recommendTableView registerClass:[RecommendTwoTableViewCell class] forCellReuseIdentifier:@"two"];
    [self.recommendTableView registerClass:[RecommendThreeTableViewCell class] forCellReuseIdentifier:@"three"];
    [self.recommendTableView registerClass:[RecommendFourTableViewCell class] forCellReuseIdentifier:@"four"];
//    [self.recommendTableView registerClass:[RecommendFiveTableViewCell class] forCellReuseIdentifier:@"five"];
    [self.recommendTableView registerClass:[FifthTableViewCell class] forCellReuseIdentifier:@"fifth"];
    
    
    [self addAllViews];
    [self requestRecommend];
    [self reloadData];
}

- (void)reloadData
{
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
    self.recommendTableView.mj_header = header;
}
//下拉刷新的回调方法
- (void)loadNewData
{
    // 模拟1.5秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.recommendTableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.recommendTableView.mj_header endRefreshing];
    });
}

- (void)requestRecommend{
    __weak typeof(self) weakSelf = self;
    [[RecommendRequest shareRecommendRequest] recommendRequestWithParameter:nil success:^(NSDictionary *dic) {

        
//-------------------fouthCell解析------------------
        for (NSDictionary *fouthDic in dic[@"data"][@"other_products"][@"product_list"]) {
            RecommendModel *model = [RecommendModel new];
            [model setValuesForKeysWithDictionary:fouthDic];
            [_fourArray addObject:model];
        }
        
//---------------------thirdCell解析---------------

        for (NSDictionary *thirdDic in dic[@"data"][@"spots"][@"spot_list"]) {
            [_threeArray addObject:thirdDic];
        }
        
//---------------------secondCell解析--------------
        for (NSDictionary *secondDic in dic[@"data"][@"hunters"][@"hunter_list"]) {
            [_twoArray addObject:secondDic];
        }

//--------------轮播解析-------------------------
        for (NSDictionary *imageDic in dic[@"data"][@"banners"]) {
            [_imageArray addObject:imageDic[@"url"]];
        }
//---------------------------------firstCell解析----------------
        for (NSDictionary *firstDic in dic[@"data"][@"product_modules"]) {
            [_array addObject:firstDic[@"product_list"]];
        }

//-----------------------searchButton解析---------------------
        for (NSDictionary *dictionary in dic[@"data"][@"tags"]) {
            [_buttonArray addObject:dictionary[@"name"]];
        }
//--------------------------没用---------
        for (NSDictionary *tempDic in dic[@"data"][@"hunters"][@"hunter_list"]) {

            RecommendModel *model = [RecommendModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.dataArray addObject:model];

        }

            [_rootArray addObject:dic[@"status"]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.recommendTableView reloadData];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}


#pragma mark -- 视图显示的时候推出tableview
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

        RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
        [milk showTabBar];
    
    
}

- (void)addAllViews
{
//----------------添加左右navigationItem--------------------
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"所有城市▶︎" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分类▶︎" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction)];
    
    
#pragma mark ---- 头视图加searchBar和轮播图
    RecommendView *recommendV = [[RecommendView alloc] initWithFrame:CGRectMake(0, 0, WindownWidth, 194)];
    recommendV.backgroundColor = [UIColor whiteColor];
    self.recommendTableView.tableHeaderView = recommendV;
    [recommendV.searchBtn addTarget:self action:@selector(searchButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [recommendV.addressBtn addTarget:self action:@selector(addressButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    recommendV.imageViewDelegate = self;
    
}
#pragma mark -- searchBtn的点击方法
- (void)searchButtonAction:(UIButton *)button
{
    RecommendSearchViewController *searchVC = [RecommendSearchViewController new];
    
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)addressButtonAction:(UIButton *)btn
{
    MapViewController *mapVC = [MapViewController new];
    mapVC.mapCityName = self.navigationItem.leftBarButtonItem.title;
    [self.navigationController pushViewController:mapVC animated:YES];
    
    
}
#pragma mark -- 点击 所有城市 触发的方法
- (void)leftAction
{
    CityViewController *cityVC = [CityViewController new];
    [self presentViewController:cityVC animated:NO completion:^{
        
        
    }];
//-------------------跳转页面传值（城市名）----------------------
    __weak typeof(self) weakSelf = self;
    cityVC.passString = ^(NSString *string){
        NSString *str = [NSString stringWithFormat:@"%@▶︎",string];
      weakSelf.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:str style:(UIBarButtonItemStylePlain) target:self action:@selector(leftAction)];
    };
}
#pragma mark -- 点击 分类 触发的方法
- (void)rightAction
{
    [self onPresent];
}

- (void)onPresent
{
    HYBModalHalfDetailController *vc = [[HYBModalHalfDetailController alloc] init];
    
    self.transition = [[HYBModalTransition alloc] initWithPresented:^(UIViewController *presented, UIViewController *presenting, UIViewController *source, HYBBaseTransition *transition) {
        HYBModalTransition *modal = (HYBModalTransition *)transition;
        modal.scale = (CGPoint){0.9, 0.9};
        modal.shouldDismissOnTap = YES;
        modal.animatedWithSpring = YES;
        
    } dismissed:^(UIViewController *dismissed, HYBBaseTransition *transition) {
        // do nothing
        transition.transitionMode = kHYBTransitionDismiss;
    }];
    
    vc.transitioningDelegate = self.transition;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section >= 0 && section < 7) {
        return self.rootArray.count;
    }

    return self.fourArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < 5 &&indexPath.section >= 0) {
        return 185;
    }
    return WindowHeight * 0.3;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"重磅推荐";
    }
    if (section == 1) {
        return nil;
    }
    else if (section == 2){
        return @"在线活动";
    }
    else if (section == 3){
        return @"抢先体验";
    }
    else if (section == 4){
        return @"特色玩法";
    }
    
//    else if (section == 5){
//        return @"下班出去浪";
//    }
    
    else if (section == 5){
        return @"明星猎人";
    }
    
    else if (section == 6){
        return @"体验故事";
    }
    else{
        return @"编辑精选";
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        cell.firstDelegate = self;
        cell.dataArr = _array;
        
        return cell;

    }
    
    if (indexPath.section == 1) {
                FifthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fifth" forIndexPath:indexPath];
        [cell.btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.btn3 addTarget:self action:@selector(btn3Action:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.btn4 addTarget:self action:@selector(btn4Action:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.btn5 addTarget:self action:@selector(btn5Action:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.btn6 addTarget:self action:@selector(btn6Action:) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
    }
    else if (indexPath.section == 2){
        RecommendTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"two" forIndexPath:indexPath];
        cell.firstTwoDelegate = self;
        cell.firstTwoArray = _array;
        return cell;
    }
    else if (indexPath.section == 3){
        RecommendThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"three" forIndexPath:indexPath];
        cell.firstThreeDelegate = self;
        cell.firstThreeArray = _array;
        return cell;
    }
    else if (indexPath.section == 4){
        RecommendFourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"four" forIndexPath:indexPath];
        cell.firstFourDelegate = self;
        cell.firstFourArray = _array;
        return cell;
    }
//    else if (indexPath.section == 5){
//        RecommendFiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"five" forIndexPath:indexPath];
//        cell.firstFiveDelegate = self;
//        cell.firstFiveArray = _array;
//        return cell;
//    }
    else if (indexPath.section == 5){
        RecommendSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"second" forIndexPath:indexPath];
        cell.secondDelegate = self;
        cell.secondArr = _twoArray;
        return cell;
    }
    else if (indexPath.section == 6){
        ThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"third" forIndexPath:indexPath];
        cell.thirdDelegate = self;
        
        cell.thirdArr = _threeArray;
        return cell;
    }
    else {
        FouthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fouth" forIndexPath:indexPath];

        RecommendModel *model = _fourArray[indexPath.row];
        cell.recommendmodel = model;

        cell.backgroundColor = [UIColor whiteColor];
        
        return cell;
    }

    
    
 }
#pragma mark -- 点击scrollView跳转页面
- (void)changePageByIndext:(NSInteger)indext
{
    RecommendImageViewController *imageVC = [RecommendImageViewController new];
    imageVC.imageUrl = self.imageArray[indext];
    [self.navigationController pushViewController:imageVC animated:YES];
}

- (void)firstChangePageByIndext:(NSInteger)indext
{

    WebViewController1 *webVC = [WebViewController1 new];
    

    webVC.passID = self.array[0][indext][@"product_id"];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)firstTwoChangePageByIndext:(NSInteger)indext
{
    
    WebViewController1 *webVC = [WebViewController1 new];
    
    
    webVC.passID = self.array[1][indext][@"product_id"];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)firstThreeChangePageByIndext:(NSInteger)indext
{
    
    WebViewController1 *webVC = [WebViewController1 new];
    
    
    webVC.passID = self.array[2][indext][@"product_id"];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)firstFourChangePageByIndext:(NSInteger)indext
{
    
    WebViewController1 *webVC = [WebViewController1 new];
    
    
    webVC.passID = self.array[3][indext][@"product_id"];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)firstFiveChangePageByIndext:(NSInteger)indext
{
    
    WebViewController1 *webVC = [WebViewController1 new];
    
    
    webVC.passID = self.array[4][indext][@"product_id"];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)secondChangePageByIndext:(NSInteger)index
{
    WebViewController1 *webVC = [WebViewController1 new];
    webVC.passID = self.twoArray[index][@"product_id"];
    
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)thirdChangePageBySelected:(NSInteger)selectedIndex
{
    
    
    WebViewController1 *webVC = [WebViewController1 new];
    webVC.passID = self.threeArray[selectedIndex][@"target"][@"id"];
    
    [self.navigationController pushViewController:webVC animated:YES];

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


        WebViewController1 *webVC = [WebViewController1 new];
        RecommendModel *model = self.fourArray[indexPath.row];
        webVC.passID = model.product_id;
        
        [self.navigationController pushViewController:webVC animated:YES];
}

- (void)btn1Action:(UIButton *)button
{

    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"117";
    listVC.btnStr = str;
    [self.navigationController pushViewController:listVC animated:YES];

}

- (void)btn2Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"116";
    listVC.btnStr = str;
    [self.navigationController pushViewController:listVC animated:YES];
    
}

- (void)btn3Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"119";
    listVC.btnStr = str;
    [self.navigationController pushViewController:listVC animated:YES];
    
}

- (void)btn4Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"106";
    listVC.btnStr = str;
    [self.navigationController pushViewController:listVC animated:YES];
    
}

- (void)btn5Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"115";
    listVC.btnStr = str;
    [self.navigationController pushViewController:listVC animated:YES];
    
}

- (void)btn6Action:(UIButton *)button
{
    
    RecommendSearchBarTableViewController *listVC = [RecommendSearchBarTableViewController new];
    NSString *str = @"5";
    listVC.btnStr = str;
    [self.navigationController pushViewController:listVC animated:YES];
    
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
