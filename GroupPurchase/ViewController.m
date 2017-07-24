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

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
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

@end
