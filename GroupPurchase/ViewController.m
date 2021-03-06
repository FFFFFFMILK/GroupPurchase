//
//  ViewController.m
//  GroupPurchase
//
//  Created by Fu on 2017/7/24.
//  Copyright © 2017年 Fu. All rights reserved.
//

#import "ViewController.h"
#import "GroupCell.h"
#import "GroupModel.h"
#import "BannerView.h"
#import "GroupFooterView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource,GroupFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

-(NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [NSMutableArray array];
        
        // 从 plist 中读取数据
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil]];
        
        // 字典转模型
        for (NSDictionary *dic in arr) {
            GroupModel *model = [GroupModel groupModelWithDict:dic];
            
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tableview的基本属性
    self.tableView.rowHeight = 90;
    
    // 设置头部
    NSArray *imgArr = @[@"ad_00",@"ad_01",@"ad_02",@"ad_03",@"ad_04"];
    
    BannerView *bannerView = [[BannerView alloc]initWithFrame:CGRectMake(0, 0, 375, 200) WithImageArray:imgArr];
    self.tableView.tableHeaderView = bannerView;
    
    // 设置尾部
    GroupFooterView *footerView = [[[NSBundle mainBundle]loadNibNamed:@"GroupFooterView" owner:nil options:nil]firstObject];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
    
}

#pragma mark - tableview datasource method
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 检查缓冲池
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupCell"];
    
    // 如果没有，则从 xib 新建
    if (nil == cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupCell" owner:nil options:nil] lastObject];
    }
    
    // 赋值
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - footerview delegate
-(void)groupFooterView:(GroupFooterView *)footerView didClickBtn:(UIButton *)btn{
    // 显示正在加载
    footerView.showLoadingView = YES;
    // 新增一个tableview cell
    // -- 延迟 2 秒执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 隐藏正在加载
        footerView.showLoadingView = NO;
        
        // 新增数据
        GroupModel *model = [[GroupModel alloc]init];
        model.icon = @"37e4761e6ecf56a2d78685df7157f097.png";
        model.title = @"新增餐馆";
        model.price = @"998";
        model.buyCount = @"3";
        
        // 添加到数据数组中
        [self.dataArray addObject:model];
        
        // 在 tableview 的最后一行添加 cell，重新载入这一行
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
        [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        // 滚动到最后一行
        [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    });
}

@end
