//
//  GHNormalMenuViewController.m
//  GHDropMenuDemo
//
//  Created by zhaozhiwei on 2018/12/29.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHNormalMenuViewController.h"
#import "GHDropMenu.h"

@interface GHNormalMenuViewController ()<GHDropMenuDelegate,GHDropMenuDataSource>
@property (nonatomic , strong)GHDropMenu *dropMenu;

@end

@implementation GHNormalMenuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self style1];
}
#pragma mark - 样式1
- (void)style1 {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kGHScreenWidth, 44)];
    label.text = @"样式1";
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];

    /** 创建dropMenu 配置模型 && frame */
    weakself(self);
    GHDropMenu *dropMenu = [GHDropMenu creatDropMenuWithConfiguration:nil frame:CGRectMake(0, kGHSafeAreaTopHeight,kGHScreenWidth, 44) dropMenuTitleBlock:^(GHDropMenuModel * _Nonnull dropMenuModel) {
        weakSelf.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",dropMenuModel.title];
    } dropMenuTagArrayBlock:^(NSArray * _Nonnull tagArray) {
        [weakSelf getStrWith:tagArray];
    }];
    dropMenu.durationTime = 0.5;
    dropMenu.delegate = self;
    dropMenu.dataSource = self;
    [self.view addSubview:dropMenu];
}


#pragma mark - 代理方法;
- (void)dropMenu:(GHDropMenu *)dropMenu dropMenuTitleModel:(GHDropMenuModel *)dropMenuTitleModel {
    self.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",dropMenuTitleModel.title];
}
- (void)dropMenu:(GHDropMenu *)dropMenu tagArray:(NSArray *)tagArray {
    [self getStrWith:tagArray];
}

- (void)getStrWith: (NSArray *)tagArray {
    NSMutableString *string = [NSMutableString string];
    if (tagArray.count) {
        for (GHDropMenuModel *dropMenuTagModel in tagArray) {
            if (dropMenuTagModel.tagSeleted) {
                if (dropMenuTagModel.tagName.length) {
                    [string appendFormat:@"%@",dropMenuTagModel.tagName];
                }
            }
            if (dropMenuTagModel.maxPrice.length) {
                [string appendFormat:@"最大价格%@",dropMenuTagModel.maxPrice];
            }
            if (dropMenuTagModel.minPrice.length) {
                [string appendFormat:@"最小价格%@",dropMenuTagModel.minPrice];
            }
        }
    }
    self.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",string];
}

- (NSArray *)columnTitlesInMeun:(GHDropMenu *)menu {
    return @[@"呵呵",@"嘿嘿",@"哈哈",@"嘻嘻"];
}
- (NSArray *)menu:(GHDropMenu *)menu numberOfColumns:(NSInteger)columns {
    if (columns == 0) {
        return @[@"第一列",@"嘿33嘿",@"哈哈",@"嘻嘻"];

    } else if (columns == 1){
        return @[@"第二列",@"嘿33嘿",@"哈哈",@"嘻嘻",@"嘿33嘿",@"哈哈",@"嘻嘻",@"嘿33嘿",@"哈哈",@"嘻嘻"];

    } else if (columns== 2){
        return @[@"第三列",@"嘿33嘿",@"哈哈",@"嘻嘻",@"哈哈",@"嘻嘻",@"哈哈",@"嘻嘻",@"哈哈",@"嘻嘻"];
        
    } else {
        return @[@"第四列",@"嘿33嘿",@"哈哈",@"嘻嘻asdsadadad",@"嘻嘻asdsadadad"];
    }

}
@end
