
//
//  TZIconHeaderView.m
//  TZGifForTactics
//
//  Created by 檀邹 on 2017/10/25.
//  Copyright © 2017年 Tanz. All rights reserved.
//

#import "TZIconHeaderView.h"

#define TZIconWH 120

@implementation TZIconHeaderView

+ (CGFloat)caculateHeight{
    return 250;
}

+ (NSString *)identifier{
    return [self description];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
        self.contentView.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)initSubviews{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    imageView.backgroundColor = [UIColor redColor];
    imageView.layer.cornerRadius = TZIconWH / 2;
    imageView.layer.masksToBounds = YES;
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(TZIconWH, TZIconWH));
    }];
}


@end
