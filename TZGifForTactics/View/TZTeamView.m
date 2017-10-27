//
//  TZTeamView.m
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/28.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import "TZTeamView.h"
#import <Masonry/Masonry.h>

#define TZPlayerWH 50
#define TZPaddingH 20
#define TZPaddingThreeW (280 - 3 * TZPlayerWH)/4
#define TZPaddingTwoW (280 - 2 * TZPlayerWH)/3

@interface TZTeamView()


@end

@implementation TZTeamView

//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor clearColor];
//    }
//    return self;
//}

- (instancetype)initWithTeamViewType:(TZTeamViewType)teamViewType{
    if (self = [super init]) {
        [self initSubviewsWithTwamViewType:teamViewType];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)initSubviewsWithTwamViewType:(TZTeamViewType)teamViewType{
    UIButton *playerSG = [self createPlayerButtonWithImage:@"" selectedImage:@""];
    
    UIButton *playerPG = [self createPlayerButtonWithImage:@"" selectedImage:@""];
    
    UIButton *playerSF = [self createPlayerButtonWithImage:@"" selectedImage:@""];
    
    UIButton *playerPF = [self createPlayerButtonWithImage:@"" selectedImage:@""];
    
    UIButton *playerC = [self createPlayerButtonWithImage:@"" selectedImage:@""];
    
    
    switch (teamViewType) {
        case TZTeamViewTypeTop:{
            [playerPF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self).mas_offset(TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(self).mas_offset(TZPaddingThreeW);
            }];
            
            [playerC mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self).mas_offset(TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(playerPF.mas_right).mas_offset(TZPaddingThreeW);
            }];
            
            [playerSF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self).mas_offset(TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(playerC.mas_right).mas_offset(TZPaddingThreeW);
            }];
            
            [playerSG mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(playerSF.mas_bottom).mas_offset(TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(self).mas_offset(TZPaddingTwoW);
            }];
            
            [playerPG mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(playerSF.mas_bottom).mas_offset(TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(playerSG.mas_right).mas_offset(TZPaddingTwoW);
            }];
            break;
        }
        case TZTeamViewTypeBottom:{
            [playerSG mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(playerPF.mas_top).mas_offset(-TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(self).mas_offset(TZPaddingTwoW);
            }];
            
            [playerPG mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(playerPF.mas_top).mas_offset(-TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(playerSG.mas_right).mas_offset(TZPaddingTwoW);
            }];
            
            [playerPF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(self).mas_offset(TZPaddingThreeW);
            }];
            
            [playerC mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(playerPF.mas_right).mas_offset(TZPaddingThreeW);
            }];
            
            [playerSF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-TZPaddingH);
                make.size.mas_equalTo(CGSizeMake(TZPlayerWH, TZPlayerWH));
                make.left.mas_equalTo(playerC.mas_right).mas_offset(TZPaddingThreeW);
            }];
            
            
            break;
        }
        default:
            break;
    }
}

- (UIButton *)createPlayerButtonWithImage:(NSString *)image selectedImage:(NSString *)selectedImage{
    UIButton *playerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playerButton setImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [playerButton setImage:[UIImage imageNamed:@"selectedImage"] forState:UIControlStateSelected];
    [self addSubview:playerButton];
    playerButton.backgroundColor = [UIColor blueColor];
    [playerButton addTarget:self action:@selector(playerButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    return playerButton;
}

- (void)playerButtonDidClick:(UIButton *)playerButton{
    playerButton.selected = !playerButton.isSelected;
    
    
}

@end
