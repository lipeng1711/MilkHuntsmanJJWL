//
//  RequestUrls.h
//  MilkHuntsman
//
//  Created by fengchunyan on 16/7/13.
//  Copyright © 2016年 South Park. All rights reserved.
//

#ifndef RequestUrls_h
#define RequestUrls_h

//发现页面请求URL
#define FindRequest_Url @"http://api.breadtrip.com/hunter/feeds/?lat=40.029178185549405&lng=116.33740447879029"

//活动详情页面请求URL
#define FindDetailRequest_Url(ID) [NSString stringWithFormat:@"http://web.breadtrip.com/hunter/product/%@/?bts=app_home",ID]

//评论页面请求URL
#define CommentRequest_Url(ID) [NSString stringWithFormat:@"http://web.breadtrip.com/hunter/product/%@/comments/more/?start=0&count=20",ID]

//推荐URL
#define RecommendRequestUrl @"http://api.breadtrip.com/hunter/products/newstyle/?city_name=%E5%8C%97%E4%BA%AC"


//个人用户请求URL
#define UserRequestUrl(ID) [NSString stringWithFormat:@"http://api.breadtrip.com/v3/user/%@/",ID]






//searchBar--URL
#define RecommendSearchBarOne_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.029320713304&lng=116.337116295128&q=%E6%91%84%E5%BD%B1&start=0"
#define RecommendSearchBarTwo_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0292676272515&lng=116.337245442565&q=%E5%8D%A0%E5%8D%9C&start=0"
#define RecommendSearchBarThree_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0292844297855&lng=116.337135652193&q=%E7%BE%8E%E9%A3%9F&start=0"
#define RecommendSearchBarFour_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0292911648049&lng=116.337167916373&q=%E6%8A%80%E8%83%BDget&start=0"
#define RecommendSearchBarFive_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0292505322211&lng=116.337109723307&q=%E6%98%8E%E4%BF%A1%E7%89%87&start=0"
#define RecommendSearchBarSix_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0292733540636&lng=116.337179702187&q=%E6%B2%B9%E7%94%BB&start=0"
#define RecommendSearchBarSeven_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0292354490764&lng=116.337261951529&q=%E5%92%A8%E8%AF%A2&start=0"
#define RecommendSearchBarEight_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0292785641499&lng=116.33715888677&q=%E6%97%85%E8%A1%8C&start=0"
#define RecommendSearchBarNine_Url @"http://api.breadtrip.com/hunter/products/v2/search/?city_name=%E5%8C%97%E4%BA%AC&lat=40.0293320854167&lng=116.33716022789&q=%E5%81%A5%E8%BA%AB&start=0"
//地址URL
#define RecommendAddressUrl @"http://api.breadtrip.com/hunter/products/v2/metadata/?city_name=%E5%85%A8%E9%83%A8%E5%9F%8E%E5%B8%82&sign=cecb2985d4d5434c4a38e3e0c696467e&with_citydata=true&with_sortdata=true"
//button list
#define RecommendListUrl @"http://api.breadtrip.com/hunter/products/v2/search/hotkeywords/?city_name=%E5%8C%97%E4%BA%AC&sign=e369213e07619733e4b2e079c20f4681"

#define RecommendButton_Url(ID) [NSString stringWithFormat:@"http://api.breadtrip.com/hunter/products/v2/?city_name=%%E6%%AD%%A6%%E6%%B1%%89&lat=40.0292208386669&lng=116.337178051353&sign=4789d4030909901a2cbdc351424df8e2&start=0&tab_list=%@",ID]

#endif /* RequestUrls_h */
