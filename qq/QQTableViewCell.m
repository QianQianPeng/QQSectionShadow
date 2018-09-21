//
//  QQTableViewCell.m
//  qq
//
//  Created by 彭倩倩 on 2018/9/21.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import "QQTableViewCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/** cell高度 */
#define cellHeight 60

@implementation QQTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(2, 0, 6, cellHeight)];
        [self addSubview:leftView];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = leftView.bounds;
        // 渐变色数组
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.12].CGColor,
                           (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0].CGColor, nil];
        gradient.startPoint = CGPointMake(1, 0);
        gradient.endPoint = CGPointMake(0, 0);
        [leftView.layer addSublayer:gradient];
        
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth - 8, 0, 6, cellHeight)];
        [self addSubview:rightView];
        
        CAGradientLayer *gradientR = [CAGradientLayer layer];
        gradientR.frame = rightView.bounds;
        // 渐变色数组
        gradientR.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.12].CGColor,
                            (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0].CGColor, nil];
        gradientR.startPoint = CGPointMake(0, 0);
        gradientR.endPoint = CGPointMake(1, 0);
        [rightView.layer addSublayer:gradientR];
        
        self.testLabel = [UILabel new];
        [self addSubview:self.testLabel];
        self.testLabel.frame = self.frame;
    }
    return self;
}

@end
