//
//  TZTacticsController.m
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/22.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import "TZTacticsController.h"
#import <SpriteKit/SpriteKit.h>
#import "TZToolController.h"
#import <MMDrawerController/MMDrawerController.h>

@interface TZTacticsController ()

@end

@implementation TZTacticsController
#pragma mark -
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavigationBar];
    
    [self initScene];
    
}

- (NSString *)title{
    return @"创建战术";
}

- (void)setupNavigationBar{
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"工具" style:UIBarButtonItemStylePlain target:self action:@selector(showTool)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}


- (void)initScene{
    SKView *view = (SKView *)self.view;
    UIImageView *playgroundView = [[UIImageView alloc] init];
    playgroundView.image = [UIImage imageNamed:@"warrior"];
    [view addSubview:playgroundView];
    
    [playgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    
    SKScene *scene = [SKScene sceneWithSize:self.view.bounds.size];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - private
- (void)showTool{
    MMDrawerController *drawerVC = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [drawerVC openDrawerSide:MMDrawerSideRight animated:YES completion:^(BOOL finished) {
        
    }];
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
