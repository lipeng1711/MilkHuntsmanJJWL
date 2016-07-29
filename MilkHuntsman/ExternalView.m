//
//  ExternalView.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/16.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "ExternalView.h"
#import "RecommendRequest.h"
#import "CityModel.h"
@implementation ExternalView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.xternalCityArr = [NSMutableArray array];
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    [self requestAddress];
    self.backgroundColor = [UIColor whiteColor];
    self.xternalTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    self.xternalTableView.dataSource = self;
    self.xternalTableView.delegate = self;
    [self addSubview:self.xternalTableView];
    
    
}

- (void)requestAddress
{
    __weak typeof(self) weakSelf = self;
    [[RecommendRequest shareRecommendRequest] recommendRequestAddressWithParameter:nil success:^(NSDictionary *dic) {

        for (NSDictionary *tempDic in dic[@"city_data"][@"oversea_city"][@"all_city_list"]) {
            CityModel *model = [CityModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.xternalCityArr addObject:model];

            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.xternalTableView reloadData];
            });
        }
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.xternalCityArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor cyanColor];
    CityModel *model = self.xternalCityArr[indexPath.row];
    cell.textLabel.text = model.name;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.backgroundColor = [UIColor clearColor];
    NSString *string = @"全部地区";
    return string;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
