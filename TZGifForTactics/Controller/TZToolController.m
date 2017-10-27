//
//  TZToolController.m
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/27.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import "TZToolController.h"
#import "TZTeamView.h"

@interface TZToolController ()


@end

@implementation TZToolController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTeamView];
    [self createToolView];
}

- (void)createTeamView{
    TZTeamView *teamViewA = [[TZTeamView alloc] initWithTeamViewType:TZTeamViewTypeTop];
    [self.view addSubview:teamViewA];
    
    TZTeamView *teamViewB = [[TZTeamView alloc] initWithTeamViewType:TZTeamViewTypeBottom];
    [self.view addSubview:teamViewB];
    
    [teamViewA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.height.mas_equalTo(200);
    }];
    
    [teamViewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.height.mas_equalTo(200);
    }];
    
}

- (void)createToolView{
    
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
