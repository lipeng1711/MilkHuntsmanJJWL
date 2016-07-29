//
//  InternalView.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/16.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "InternalView.h"
#import "CityModel.h"
@implementation InternalView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _internalCityArr = [NSMutableArray array];
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    [self requestAddress];
    self.backgroundColor = [UIColor whiteColor];
    _internalTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    _internalTableView.dataSource = self;
    _internalTableView.delegate = self;
    [self addSubview:_internalTableView];
    
    
}

- (void)requestAddress
{
    [[RecommendRequest shareRecommendRequest] recommendRequestAddressWithParameter:nil success:^(NSDictionary *dic) {

        for (NSDictionary *tempDic in dic[@"city_data"][@"domestic_city"][@"all_city_list"]) {
            CityModel *model = [CityModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            [_internalCityArr addObject:model];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_internalTableView reloadData];
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

    return self.internalCityArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor cyanColor];

    CityModel *model = _internalCityArr[indexPath.row];
    cell.textLabel.text = model.name;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    tableView.backgroundColor = [UIColor clearColor];
    NSString *string = @"全部城市";
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
