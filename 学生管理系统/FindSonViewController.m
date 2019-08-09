//
//  FindSonViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "FindSonViewController.h"
#import "FindSonTableViewCell.h"

@interface FindSonViewController ()

@end

@implementation FindSonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [UIImage imageNamed:@"背景17.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(60, 200, 300, 50)];
    label1.textColor = [UIColor whiteColor];
    label1.tintColor = [UIColor clearColor];
    label1.font = [UIFont systemFontOfSize:28];
    label1.text = @"您查找的学生信息为：";
    [self.view addSubview:label1];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 290, [UIScreen mainScreen].bounds.size.width, 550) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[FindSonTableViewCell class] forCellReuseIdentifier:@"111"];
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.frame = CGRectMake(180, 570, 200, 50);
    [self.view addSubview:back];
    [back setTitle:@"back" forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont systemFontOfSize:25];
    back.tintColor = [UIColor whiteColor];
    back.backgroundColor = [UIColor clearColor];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
}

- (void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FindSonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    
    cell.nameLabel.text = _nameArr[indexPath.row];
    cell.ageLabel.text = _ageArr[indexPath.row];
    cell.classLabel.text = _classArr[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
