//
//  TZLeftSettingController.m
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/22.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import "TZLeftSettingController.h"
#import "TZIconHeaderView.h"
#import "TZSettingCell.h"
#import "TZSettingModel.h"

@interface TZLeftSettingController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *settingList;


@end

@implementation TZLeftSettingController

#pragma mark -
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor blackColor];
    
    [self createTableView];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)createTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[TZIconHeaderView class] forHeaderFooterViewReuseIdentifier:[TZIconHeaderView identifier]];
    [tableView registerClass:[TZSettingCell class] forCellReuseIdentifier:[TZSettingCell identifier]];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
}


#pragma mark -
#pragma mark - private


#pragma mark -
#pragma mark - lazy load
- (NSArray *)settingList
{
    if (_settingList == nil) {
    
        TZSettingModel *home = [[TZSettingModel alloc] init];
        home.icon = [UIImage imageNamed:@"icons8-Home"];
        home.text = @"主页";
        
        TZSettingModel *message = [[TZSettingModel alloc] init];
        message.icon = [UIImage imageNamed:@"icons8-Message"];
        message.text = @"消息";
        
        TZSettingModel *contacts = [[TZSettingModel alloc] init];
        contacts.icon = [UIImage imageNamed:@"icons8-Contacts"];
        contacts.text = @"联系人";
        
        TZSettingModel *help = [[TZSettingModel alloc] init];
        help.icon = [UIImage imageNamed:@"icons8-Help"];
        help.text = @"帮助";
        
        _settingList = @[home,message,contacts,help];
    }
    return _settingList;
}


#pragma mark -
#pragma mark - tableViewDatasource delegate
//分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.settingList.count;
}
//初始化cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TZSettingCell *cell = [TZSettingCell cellWithTableView:tableView];
    cell.model = self.settingList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [TZSettingCell caculateHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [TZIconHeaderView caculateHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TZIconHeaderView *iconHeader = [[TZIconHeaderView alloc] init];
    return iconHeader;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
    
    
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
