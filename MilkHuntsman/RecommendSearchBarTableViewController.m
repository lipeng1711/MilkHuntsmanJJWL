//
//  RecommendSearchBarTableViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/23.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "RecommendSearchBarTableViewController.h"
#import "RecommendSearchTableViewCell.h"
#import "RecommendSearchBarModel.h"
#import "WebViewController.h"
#import "RecommendOtherRequest.h"
#import "RecommendRequest.h"

@interface RecommendSearchBarTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *searchBarArry;

@end

@implementation RecommendSearchBarTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.titleString;
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    [GiFHUD show];
    [milk hiddenTabBar];


}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    RootViewController *milk = (RootViewController *)self.navigationController.parentViewController;
    
    [milk showTabBar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [GiFHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBarArry = [NSMutableArray array];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    
    [self.tableView registerNib:[UINib nibWithNibName:@"RecommendSearchTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:RecommendSearchTableViewCell_indentify];
    
    if ([self.titleString isEqualToString:@"摄影"]) {
        [self requestButtonone];
    }
    else if ([self.titleString isEqualToString:@"占卜"]){
        [self requestButtontwo];
    }
    else if ([self.titleString isEqualToString:@"美食"]){
        [self requestButtonthree];
    }
    else if ([self.titleString isEqualToString:@"技能get"]){
        [self requestButtonfour];
    }
    else if ([self.titleString isEqualToString:@"明信片"]){
        [self requestButtonfive];
    }
    else if ([self.titleString isEqualToString:@"油画"]){
        [self requestButtonsix];
    }
    else if ([self.titleString isEqualToString:@"咨询"]){
        [self requestButtonseven];
    }
    else if ([self.titleString isEqualToString:@"旅行"]){
        [self requestButtoneight];
    }
    else if ([self.titleString isEqualToString:@"健身"]){
        [self requestButtonnine];
    }
    
    if ([self.btnStr isEqualToString:@"117"]) {
        [self requestButton:@"117"];
    }
    else if ([self.btnStr isEqualToString:@"116"]){
        [self requestButton:@"116"];
    }
    else if ([self.btnStr isEqualToString:@"119"]){
        [self requestButton:@"119"];
    }
    else if ([self.btnStr isEqualToString:@"106"]){
        [self requestButton:@"106"];
    }
    else if ([self.btnStr isEqualToString:@"115"]){
        [self requestButton:@"115"];
    }
    else if ([self.btnStr isEqualToString:@"105"]){
        [self requestButton:@"105"];
    }
    else if ([self.btnStr isEqualToString:@"5"]){
        [self requestButton:@"5"];
    }
    
    
}

- (void)requestButton:(NSString *)ID
{
    __weak typeof(self) weakSelf = self;
    [[RecommendRequest shareRecommendRequest] recommendRequestButtonWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        for (NSDictionary *tempDic in dic[@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtonone
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListOneWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtontwo
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListTwoWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtonthree
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListThreeWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtonfour
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListFourWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtonfive
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListFiveWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtonsix
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListSixWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtonseven
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListSevenWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtoneight
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListEightWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)requestButtonnine
{
    __weak typeof(self) weakSelf = self;
    [[RecommendOtherRequest shareRecommendOtherRequest] recommendRequestListNineWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        for (NSDictionary *tempDic in dic[@"data"][@"product_list"]) {
            RecommendSearchBarModel *model = [RecommendSearchBarModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.searchBarArry addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.searchBarArry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RecommendSearchTableViewCell_indentify forIndexPath:indexPath];
    
    RecommendSearchBarModel *model = self.searchBarArry[indexPath.row];
    cell.searchBarModel = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendSearchBarModel *model = self.searchBarArry[indexPath.row];
    WebViewController1 *webVC = [WebViewController1 new];
    webVC.passID = model.product_id;
    [self.navigationController pushViewController:webVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
