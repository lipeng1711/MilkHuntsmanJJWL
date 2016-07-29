//
//  FindTableViewCell.m
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/14.
//  Copyright © 2016年 South Park. All rights reserved.
//

#import "FindTableViewCell.h"
#import "FindView.h"


@interface FindTableViewCell ()

//头像图标6
@property (weak, nonatomic) IBOutlet UIImageView *headIcon6;

@end

@implementation FindTableViewCell


//重写set方法,给cell赋值(这种方法其实不太好,太low,容易写错字符串,其实用我原来的model模型会更好一点,但TM我写的懵逼了,以后补齐)
- (void)setFindModel:(FindModel *)findModel{
    _findModel = findModel;
    
    if ([findModel.category isEqualToString:@"share_product"]) {
#pragma mark =========== product的 赋值 ============
        [self.findImageV setImageWithURL:[NSURL URLWithString:[findModel.product objectForKey:@"cover"]] placeholderImage:nil];
        self.titleLabel.text = [findModel.product objectForKey:@"title"];
        
        self.findPrice.text = [NSString stringWithFormat:@"￥%@",[findModel.	product objectForKey:@"price"]];
        
        if (findModel.product[@"distance"] == [NSNull null]) {
            self.findDistance.text = [NSString stringWithFormat:@"%@",findModel.product[@"address"]];
        }else{
            self.findDistance.text = [NSString stringWithFormat:@"%@ · %@",findModel.product[@"distance"],findModel.product[@"address"]];
        }

        self.findDetailLabel.text = [NSString stringWithFormat:@"%@",findModel.product[@"text"]];
        
    }else if([findModel.category isEqualToString:@"spot"]){
#pragma mark ========== spot 的赋值 ============
        [self.findImageV setImageWithURL:[NSURL URLWithString:[[findModel.spot objectForKey:@"covers"] firstObject]]];
        
        self.titleLabel.text = [NSString stringWithFormat:@"%@",findModel.spot[@"text"]];
//        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.titleLabel sizeToFit];
        
        self.findPrice.text = NULL;
        
    }else{
#pragma mark === 发布活动的赋值 和share_product一样,但是category 不同 ====
        [self.findImageV setImageWithURL:[NSURL URLWithString:[findModel.product objectForKey:@"cover"]] placeholderImage:nil];
        self.titleLabel.text = [findModel.product objectForKey:@"title"];
        
        self.findPrice.text = [NSString stringWithFormat:@"￥%@",[findModel.	product objectForKey:@"price"]];
        
        if (findModel.product[@"distance"] == [NSNull null]) {
            self.findDistance.text = [NSString stringWithFormat:@"%@",findModel.product[@"address"]];
        }else{
            self.findDistance.text = [NSString stringWithFormat:@"%@ · %@",findModel.product[@"distance"],findModel.product[@"address"]];
        }
        
        self.findDetailLabel.text = [NSString stringWithFormat:@"%@",findModel.product[@"text"]];
    }
    
    [self.commentBtn setTitle:[NSString stringWithFormat:@"%@",findModel.comment_count] forState:(UIControlStateNormal)];
    
    self.likeUsers.text = [NSString stringWithFormat:@"%@个人赞",findModel.liked_count];
    
#pragma  mark ============== 头像图标赋值 ===================
    
    NSArray *headIconArr = @[self.headIcon1,self.headIcon2,self.headIcon3,self.headIcon4,self.headIcon5];

    if (findModel.liked_users.count) {
        for (int i = 0; i < findModel.liked_users.count - 1; i++) {
            UIImageView *imageV = headIconArr[i];
            [imageV setImageWithURL:[NSURL URLWithString:[[findModel.liked_users objectAtIndex:i] objectForKey:@"avatar_s"]]];
        }
    }
    
  //将product_id传递过去.
    self.tempStrID = findModel.product_id;
    
}



- (void)awakeFromNib {
  //将头像图标全部处理
    NSArray *arr = @[_headIcon1,_headIcon2,_headIcon3,_headIcon4,_headIcon5,_headIcon6];
    
    for (int i = 0; i < 6; i++) {
        [self disposeImageV:arr[i]];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//评论button代理方法
- (IBAction)commentBtn:(UIButton *)sender {
    [self.btnDelegate commentBtnDelegate:self.tempStrID];
}

//处理图片方法
- (void)disposeImageV:(UIImageView *)imageV{
    
    imageV.layer.masksToBounds = YES;
    imageV.layer.cornerRadius = imageV.bounds.size.width / 2.0;
}




@end
