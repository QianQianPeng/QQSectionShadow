//
//  ViewController.m
//  qq
//
//  Created by 彭倩倩 on 2018/9/21.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import "ViewController.h"
#import "QQTableViewCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/** cell高度 */
#define cellHeight 60
/** cell组头部高度*/
#define footerViewHeight 44
/** cell组尾部高度 */
#define headerViewHeight 44

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
static NSString *cellID = @"cellID";
static NSString *headerID = @"headerID";
static NSString *footerID = @"footerID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[QQTableViewCell class] forCellReuseIdentifier:cellID];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.testLabel.text = [NSString stringWithFormat:@"       第%ld组, 第%ld行", indexPath.section+1, indexPath.row+1];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return headerViewHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return footerViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, headerViewHeight)];
    view.backgroundColor = [UIColor whiteColor];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(2, 4, 6, headerViewHeight-4)];
    [view addSubview:leftView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, headerViewHeight)];
    label.text = [NSString stringWithFormat:@"       组头%ld", section+1];
    [view addSubview:label];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = leftView.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0].CGColor,
                       (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.12].CGColor, nil];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    [leftView.layer addSublayer:gradient];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth - 8, 4, 6, headerViewHeight-4)];
    [view addSubview:rightView];
    CAGradientLayer *gradientR = [CAGradientLayer layer];
    gradientR.frame = rightView.bounds;
    gradientR.colors = [NSArray arrayWithObjects:
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.12].CGColor,
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0].CGColor, nil];
    gradientR.startPoint = CGPointMake(0, 0);
    gradientR.endPoint = CGPointMake(1, 0);
    [rightView.layer addSublayer:gradientR];
    
    UIView *topV = [[UIView alloc] initWithFrame:CGRectMake(6, 2, kScreenWidth - 12, 2)];
    [view addSubview:topV];
    CAGradientLayer *gradientT = [CAGradientLayer layer];
    gradientT.frame = topV.bounds;
    gradientT.colors = [NSArray arrayWithObjects:
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.12].CGColor,
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0].CGColor, nil];
    gradientT.startPoint = CGPointMake(0, 1);
    gradientT.endPoint = CGPointMake(0, 0);
    [topV.layer addSublayer:gradientT];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, footerViewHeight)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, footerViewHeight)];
    label.text = [NSString stringWithFormat:@"       组尾%ld", section+1];
    [view addSubview:label];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(2, 0, 6, footerViewHeight-4)];
    [view addSubview:leftView];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = leftView.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.12].CGColor,
                       (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0].CGColor, nil];
    gradient.startPoint = CGPointMake(1, 0);
    gradient.endPoint = CGPointMake(0, 0);
    [leftView.layer addSublayer:gradient];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth - 8, 0, 6, footerViewHeight-4)];
    [view addSubview:rightView];
    CAGradientLayer *gradientR = [CAGradientLayer layer];
    gradientR.frame = rightView.bounds;
    gradientR.colors = [NSArray arrayWithObjects:
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0) blue:(0/255.0)  alpha:0.12].CGColor,
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0].CGColor, nil];
    gradientR.startPoint = CGPointMake(0, 0);
    gradientR.endPoint = CGPointMake(1, 0);
    [rightView.layer addSublayer:gradientR];
    
    UIView *bottomV = [[UIView alloc] initWithFrame:CGRectMake(6, footerViewHeight-4, kScreenWidth - 12, 2)];
    [view addSubview:bottomV];
    CAGradientLayer *gradientB = [CAGradientLayer layer];
    gradientB.frame = bottomV.bounds;
    gradientB.colors = [NSArray arrayWithObjects:
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0) blue:(0/255.0)  alpha:0.12].CGColor,
                        (id)[UIColor colorWithRed:(0/255.0)  green:(0/255.0) blue:(0/255.0)  alpha:0.0].CGColor, nil];
    gradientB.startPoint = CGPointMake(0, 0);
    gradientB.endPoint = CGPointMake(0, 1.0);
    [bottomV.layer addSublayer:gradientB];
    return view;
}

@end
