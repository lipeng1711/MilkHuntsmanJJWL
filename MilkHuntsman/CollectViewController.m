//
//  CollectViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/21.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "CollectViewController.h"
#import "CoreSingleHandle.h"
#import "CoredataModel.h"
#import "coreManager.h"
#import "CollectTableViewCell.h"
#import "WebViewController.h"

@interface CollectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //定义一个实例变量  用来存储 编辑的样式
    UITableViewCellEditingStyle _editingStyle;
}

@property (nonatomic, strong) UITableView *collectTableView;
@property (nonatomic, strong) NSString *modelStr;

@end

@implementation CollectViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height- 110) style:(UITableViewStylePlain)];
    [self.view addSubview:self.collectTableView];
    
    self.collectTableView.dataSource = self;
    self.collectTableView.delegate = self;
    
    //重新注册
    [self.collectTableView registerNib:[UINib nibWithNibName:@"CollectTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CollectTableViewCell_Identify];
    
    self.collectTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightAction:)];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CoreSingleHandle *core = [CoreSingleHandle shareCoreSingleHandle];
    return core.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CollectTableViewCell_Identify forIndexPath:indexPath];
    
    //单例赋值
    CoredataModel *model = [CoreSingleHandle shareCoreSingleHandle].dataArray[indexPath.row];
    
    [cell.collectImageV setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:nil];
    
    cell.titleLabel.text = model.title;
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%@ 元起",model.price];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CoredataModel *model = [CoreSingleHandle shareCoreSingleHandle].dataArray[indexPath.row];
//传值,复用webViewController界面
    WebViewController1 *web1VC = [[WebViewController1 alloc] init];
    web1VC.passID = model.product_id;
    
    [self.navigationController pushViewController:web1VC animated:YES];
}


#pragma mark ============= 实现删除的功能 =====================
//点击右按钮删除的方法
-(void)rightAction:(UIBarButtonItem *)sender{
    NSLog(@"删除");
    //第一步：设置编辑样式 让 tableView 处于编辑状态
    _editingStyle = UITableViewCellEditingStyleDelete;
    
    if (self.collectTableView.editing == YES) {
        sender.title = @"编辑";
        [self.collectTableView setEditing:NO animated:YES];
    }else{
        sender.title = @"完成";
        [self.collectTableView setEditing:YES animated:YES];
    }
}


//第二步：确定哪一些 cell 可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

//第三步：选择编辑样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _editingStyle;
}

//第四步：提交完成编辑 提交编辑结果
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //需要删除的model
    CoredataModel *model = [CoreSingleHandle shareCoreSingleHandle].dataArray[indexPath.row];
    //注意：编辑时，先修改数据源，在更新UI
    if (_editingStyle == UITableViewCellEditingStyleDelete) {
        //数组删除
        [[CoreSingleHandle shareCoreSingleHandle].dataArray removeObject:model];
        //从数据库中删除
        coreManager *manager = [coreManager new];
        [manager deleteObjectContext:model];
    }
    //刷新UI
    /*
     这里我们不用[tableView reloadData];reloadData是刷新整个UITableView,这里我们需要局部刷新只刷新一个cell、只刷新一个section等等。这个时候在调用reloadData方法，虽然用户看不出来，但是有些浪费资源。
     以下是对UITableView的优化
     NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
     [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationFade];
     */
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
}

@end
