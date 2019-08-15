//
//  FirstViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "FindViewController.h"
#import "Student.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [UIImage imageNamed:@"背景10.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 500) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"111"];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:addButton];
    addButton.frame = CGRectMake(100, 570, 100, 50);
    [addButton setTitle:@"add" forState:UIControlStateNormal];
    addButton.tintColor = [UIColor whiteColor];
    addButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchDown];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:deleteButton];
    deleteButton.frame = CGRectMake(250, 570, 100, 50);
    [deleteButton setTitle:@"delete" forState:UIControlStateNormal];
    deleteButton.tintColor = [UIColor whiteColor];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchDown];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:changeButton];
    changeButton.frame = CGRectMake(100, 640, 100, 50);
    [changeButton setTitle:@"change" forState:UIControlStateNormal];
    changeButton.tintColor = [UIColor whiteColor];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [changeButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
    
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:findButton];
    findButton.frame = CGRectMake(250, 640, 100, 50);
    [findButton setTitle:@"find" forState:UIControlStateNormal];
    findButton.tintColor = [UIColor whiteColor];
    findButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [findButton addTarget:self action:@selector(find) forControlEvents:UIControlEventTouchDown];
    
    UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:exitButton];
    exitButton.frame = CGRectMake(250, 730, 100, 50);
    [exitButton setTitle:@"exit" forState:UIControlStateNormal];
    exitButton.tintColor = [UIColor whiteColor];
    exitButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [exitButton addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchDown];
    
    
    _nameArr = [[NSMutableArray alloc] init];
    [_nameArr addObject:@"张三"];
    [_nameArr addObject:@"李四"];
    [_nameArr addObject:@"王麻子"];
    [_nameArr addObject:@"hahaha"];
    
    _ageArr = [[NSMutableArray alloc ]init];
    [_ageArr addObject:@"38"];
    [_ageArr addObject:@"250"];
    [_ageArr addObject:@"2"];
    [_ageArr addObject:@"123"];
    
    _classArr = [[NSMutableArray alloc] init];
    [_classArr addObject:@"a班"];
    [_classArr addObject:@"b班"];
    [_classArr addObject:@"c班"];
    [_classArr addObject:@"d班"];
    /*
    _stuArr = [[NSMutableArray alloc] init];
    Student *stu1 = [[Student alloc] init];
    stu1.nameStr = @"鸡大仙";
    stu1.ageStr = @"250";
    stu1.classStr = @"神经a班";
    [_stuArr addObject:stu1];
    Student *stu2 = [[Student alloc] init];
    stu2.nameStr = @"王二狗";
    stu2.ageStr = @"38";
    stu2.classStr = @"神经b班";
    [_stuArr addObject:stu2];
    Student *stu3 = [[Student alloc] init];
    stu3.nameStr = @"张钢蛋";
    stu3.ageStr = @"2";
    stu3.classStr = @"神经c班";
    [_stuArr addObject:stu3];*/
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    
    [cell give:indexPath Arr1:_nameArr Arr2:_ageArr Arr3:_classArr];
    
    return cell;
    
}

- (void)exit{
    exit(0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (void)add {
    
    AddViewController *addRoot = [[AddViewController alloc] init];
    addRoot.nameArr = _nameArr;
    addRoot.ageArr = _ageArr;
    addRoot.classArr = _classArr;
    addRoot.addDelegate = self;
    [self presentViewController:addRoot animated:NO completion:nil];
    
}

- (void)delete {
    
    DeleteViewController *deleteRoot = [[DeleteViewController alloc] init];
    deleteRoot.nameArr = _nameArr;
    deleteRoot.ageArr = _ageArr;
    deleteRoot.classArr = _classArr;
    deleteRoot.deleteDelegate = self;
    [self presentViewController:deleteRoot animated:NO completion:nil];
    
}

- (void)change{
    
    ChangeViewController *changeRoot = [[ChangeViewController alloc] init];
    changeRoot.nameArr = _nameArr;
    changeRoot.ageArr = _ageArr;
    changeRoot.classArr = _classArr;
    changeRoot.changeDelegate = self;
    [self presentViewController:changeRoot animated:NO completion:nil];
    
}

- (void)find{
    
    FindViewController *findRoot = [[FindViewController alloc] init];
    findRoot.nameArr = _nameArr;
    findRoot.ageArr = _ageArr;
    findRoot.classArr = _classArr;
    [self presentViewController:findRoot animated:NO completion:nil];
    
}

- (void)pass:(Student *)student {
    
    [_nameArr addObject:student.nameStr];
    [_ageArr addObject:student.ageStr];
    [_classArr addObject:student.classStr];
    [_tableView reloadData];
    
}

- (void)deletepass1:(NSMutableArray *)nameArr pass2:(NSMutableArray *)ageArr pass3:(NSMutableArray *)classArr{
    
    _nameArr = nameArr;
    _ageArr = ageArr;
    _classArr = classArr;
    [_tableView reloadData];
    
}

- (void)changePass1:(NSMutableArray *)nameArr Pass2:(NSMutableArray *)ageArr Pass3:(NSMutableArray *)classArr{
    
    _nameArr = nameArr;
    _ageArr = ageArr;
    _classArr = classArr;
    [_tableView reloadData];
    
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
