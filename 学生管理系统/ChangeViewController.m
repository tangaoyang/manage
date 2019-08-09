//
//  ChangeViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "ChangeViewController.h"
#import "ChangeSonViewController.h"
#import "FirstTableViewCell.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [UIImage imageNamed:@"背景13.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    UIImage *nameImage = [UIImage imageNamed:@"姓名.png"];
    UIImageView *nameImageView = [[UIImageView alloc] initWithImage:nameImage];
    nameImageView.frame = CGRectMake(3, 3, 45, 45);
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.layer.cornerRadius = 5;
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _nameTextField.tintColor = [UIColor whiteColor];
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.backgroundColor = [UIColor clearColor];
    _nameTextField.frame = CGRectMake(80, 550, 250, 50);
    _nameTextField.placeholder = @"请输入学生姓名";
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameImageView;
    [self.view addSubview:_nameTextField];
    
    UIButton *change = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:change];
    change.frame = CGRectMake(110, 620, 80, 30);
    change.titleLabel.font = [UIFont systemFontOfSize:25];
    [change setTitle:@"完成" forState:UIControlStateNormal];
    change.backgroundColor = [UIColor clearColor];
    change.tintColor = [UIColor whiteColor];
    [change addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:back];
    back.frame = CGRectMake(250, 620, 80, 30);
    back.titleLabel.font = [UIFont systemFontOfSize:25];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    back.backgroundColor = [UIColor clearColor];
    back.tintColor = [UIColor whiteColor];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"111"];
    
    //键盘上移
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    [cell give:indexPath Arr1:_nameArr Arr2:_ageArr Arr3:_classArr];
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

- (void)change{
    
    int i;
    for(i = 0; i < _nameArr.count; i++){
        if([_nameArr[i] isEqualToString:_nameTextField.text]){
            break;
        }
    }
    if(i != _nameArr.count){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"存在此人，是否继续修改" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action){
            ChangeSonViewController *sonRoot = [[ChangeSonViewController alloc] init];
            sonRoot.nameArr = self->_nameArr;
            sonRoot.ageArr = self->_ageArr;
            sonRoot.classArr = self->_classArr;
            sonRoot.str = self->_nameTextField.text;
            sonRoot.changeSonDelegate = self;
            [self presentViewController:sonRoot animated:NO completion:nil];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cancel];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
    }
    if(i == _nameArr.count){
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
        [alert1 addAction:sure1];
        [self presentViewController:alert1 animated:NO completion:nil];
    }
}

- (void)back{
    if([_changeDelegate respondsToSelector:@selector(changePass1:Pass2:Pass3:)]){
        [_changeDelegate changePass1:_nameArr Pass2:_ageArr Pass3:_classArr];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)changeSonPass1:(NSMutableArray *)nameArr Pass2:(NSMutableArray *)ageArr Pass3:(NSMutableArray *)classArr{
    
    _nameArr = nameArr;
    _ageArr = ageArr;
    _classArr = classArr;
    [_tableView reloadData];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameTextField endEditing:YES];
}

-(void)keyboardWillShow : (NSNotification *)notify {
    CGFloat kbHeight = [[notify.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat offset = kbHeight - 100;
    
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (offset > 0) {
        [UIView animateWithDuration:duration animations:^{
            self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}

-(void)keyboardWillHide: (NSNotification *)notify {
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
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
