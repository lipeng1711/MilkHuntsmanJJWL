//
//  secondViewController.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/25.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:53/255.0 green:191/255.0 blue:202/255.0 alpha:1];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.segmented.tintColor = [UIColor clearColor];//去掉颜色,现在整个segment都看不见
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor blackColor]};
    [self.segmented setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor lightGrayColor]};
    [self.segmented setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SegmentedClick:(UISegmentedControl *)sender {
    self.scrollView.contentOffset = CGPointMake(sender.selectedSegmentIndex * 414, 0);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.segmented.selectedSegmentIndex = self.scrollView.contentOffset.x / 414;
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
