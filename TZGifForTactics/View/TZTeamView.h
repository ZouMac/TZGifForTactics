//
//  TZTeamView.h
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/28.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    TZTeamViewTypeTop,
    TZTeamViewTypeBottom,
} TZTeamViewType;

@interface TZTeamView : UIView

- (instancetype)initWithTeamViewType:(TZTeamViewType)teamViewType;
@end
