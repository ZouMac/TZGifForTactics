//
//  TZSettingCell.m
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/25.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import "TZSettingCell.h"
#import "TZSettingModel.h"

#define TZPdading 15

@interface TZSettingCell()

@property (weak, nonatomic) UIImageView *icon;

@property (weak, nonatomic) UILabel *label;

@end

@implementation TZSettingCell

+ (CGFloat)caculateHeight{
    return 60;
}

+ (NSString *)identifier{
    return [self description];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    TZSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:[TZSettingCell identifier]];
    if (cell == nil) {
        cell = [[TZSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[TZSettingCell identifier]];
    }
    
    [cell initSubviews];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


- (void)initSubviews{
    UIImageView *icon = [[UIImageView alloc] init];
    [self addSubview:icon];
    self.icon = icon;
    
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    label.textColor = [UIColor whiteColor];
    self.label = label;
    
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = [UIColor lightGrayColor];
    
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(TZPdading);
        make.bottom.mas_equalTo(self).mas_offset(-TZPdading);
        make.leading.mas_equalTo(self).mas_offset(TZPdading);
        make.width.mas_equalTo(icon.mas_height);
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(icon.mas_right).mas_offset(TZPdading);
        make.top.bottom.right.mas_equalTo(self);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_bottom);
        make.left.mas_equalTo(self).mas_offset(TZPdading);
        make.right.mas_equalTo(self).mas_offset(-TZPdading);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)setModel:(TZSettingModel *)model{
    if (model != nil) {
        self.icon.image = model.icon;
        self.label.text = model.text;
    }
}


@end
