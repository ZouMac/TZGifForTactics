//
//  TZSettingCell.h
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/25.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TZSettingModel;

@interface TZSettingCell : UITableViewCell

@property (strong, nonatomic) TZSettingModel *model;


+ (CGFloat)caculateHeight;

+ (NSString *)identifier;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
