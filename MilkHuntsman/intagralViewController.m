//
//  intagralViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/15.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "intagralViewController.h"

@interface intagralViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UICollectionView *MyCollectionView;
@property(nonatomic,strong)UIView *collectionHeadView;

@end

@implementation intagralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:53/255.0 green:191/255.0 blue:202/255.0 alpha:1];
    
    [self.MyCollectionView registerNib:[UINib nibWithNibName:@"integralCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"coCell"];
    
    [self header];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
}
//表头
- (void)header{
    self.collectionHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.MyCollectionView.frame.size.width, 100)];
    self.collectionHeadView.backgroundColor = [UIColor whiteColor];
    UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 22, 55, 55)];
    headImageView.layer.masksToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.bounds.size.width / 2.0;
    headImageView.backgroundColor = [UIColor redColor];
    
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    if (app.hasLogined) {
        if ([JJZshare shareheadImage].headImage) {
            NSString *headImage = [JJZshare shareheadImage].headImage;
            NSData *imageData = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"imageName:%@",headImage]];
            headImageView.image = [UIImage imageWithData:imageData];
        }
    }else{
        headImageView.image = nil;
    }
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 27, 80, 20)];
    nameLabel.text = [[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"myUserName%@",[JJZshare shareheadImage].headImage]];
    UILabel *integral = [[UILabel alloc]initWithFrame:CGRectMake(70, 47, 150, 15)];
    integral.text = [JJZshare shareheadImage].integral;
    //label字体大小
    integral.font = [UIFont boldSystemFontOfSize:10];
    [self.collectionHeadView addSubview:integral];
    [self.collectionHeadView addSubview:nameLabel];
    [self.collectionHeadView addSubview:headImageView];
    [self.MyCollectionView addSubview:self.collectionHeadView];
}

//表头高度
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(self.MyCollectionView.frame.size.width, 100);
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    integralCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coCell" forIndexPath:indexPath];
    cell.fixLabel.text = @"所需积分";
    cell.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row + 1]];
    cell.fixLabel.font = [UIFont boldSystemFontOfSize:11];
    cell.numLabel.text = [NSString stringWithFormat:@"%u",arc4random()%2001 + 500];
    NSArray *arr = @[@"爸爸妈妈",@"红豆",@"爱情",@"明年今日",@"我只在乎你",@"大海",@"一生爱你千百回",@"千千阙歌",@"丑八怪",@"饿狼传说"];
    cell.nameLabel.text = arr[indexPath.row];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = cell.bounds.size.width / 50;
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.MyCollectionView.frame.size.width * 0.5 - 5, self.MyCollectionView.frame.size.width * 0.5 + 15);
    
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
