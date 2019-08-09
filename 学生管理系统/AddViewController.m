//
//  AddViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "AddViewController.h"
#import "FirstTableViewCell.h"

@interface AddViewController ()

@end

@implementation AddViewController

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
    _nameTextField.frame = CGRectMake(80, 500, 250, 50);
    _nameTextField.placeholder = @"请输入学生姓名";
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameImageView;
    [self.view addSubview:_nameTextField];
    
    UIImage *ageImage = [UIImage imageNamed:@"年龄.png"];
    UIImageView *ageImageView = [[UIImageView alloc] initWithImage:ageImage];
    ageImageView.frame = CGRectMake(3, 3, 45, 45);
    _ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 565, 250, 50)];
    [self.view addSubview:_ageTextField];
    _ageTextField.placeholder = @"请输入学生年龄";
    _ageTextField.layer.masksToBounds = YES;
    _ageTextField.layer.borderWidth = 2;
    _ageTextField.layer.cornerRadius = 5;
    _ageTextField.tintColor = [UIColor whiteColor];
    _ageTextField.textColor = [UIColor whiteColor];
    _ageTextField.backgroundColor = [UIColor clearColor];
    _ageTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _ageTextField.leftViewMode = UITextFieldViewModeAlways;
    _ageTextField.leftView = ageImageView;
    
    UIImage *classImage = [UIImage imageNamed:@"房子.png"];
    UIImageView *classImageView = [[UIImageView alloc] initWithImage:classImage];
    classImageView.frame = CGRectMake(3, 3, 45, 45);
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 630, 250, 50)];
    [self.view addSubview:_classTextField];
    _classTextField.placeholder = @"请输入学生班级";
    _classTextField.layer.masksToBounds = YES;
    _classTextField.layer.borderWidth = 2;
    _classTextField.layer.cornerRadius = 5;
    _classTextField.tintColor = [UIColor whiteColor];
    _classTextField.textColor = [UIColor whiteColor];
    _classTextField.backgroundColor = [UIColor clearColor];
    _classTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _classTextField.leftViewMode = UITextFieldViewModeAlways;
    _classTextField.leftView = classImageView;
    
    UIButton *add = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:add];
    add.frame = CGRectMake(110, 700, 80, 30);
    add.titleLabel.font = [UIFont systemFontOfSize:25];
    [add setTitle:@"完成" forState:UIControlStateNormal];
    add.backgroundColor = [UIColor clearColor];
    add.tintColor = [UIColor whiteColor];
    [add addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchDown];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:back];
    back.frame = CGRectMake(250, 700, 80, 30);
    back.titleLabel.font = [UIFont systemFontOfSize:25];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    back.backgroundColor = [UIColor clearColor];
    back.tintColor = [UIColor blackColor];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2 - 100) style:UITableViewStylePlain];
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

- (void)add{
    
    int i;
    for(i = 0; i< _nameArr.count; i++){
        if([_nameArr[i] isEqualToString:_nameTextField.text]){
            break;
        }
    }
    if(i != _nameArr.count){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"姓名有重复，请核对后再试！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
    }
    if(i == _nameArr.count){
        [self dismissViewControllerAnimated:NO completion:nil];
        if([_addDelegate respondsToSelector:@selector(pass:)]) {
            Student *stu = [[Student alloc] init];
            stu.nameStr = _nameTextField.text;
            stu.ageStr = _ageTextField.text;
            stu.classStr = _classTextField.text;
            [_addDelegate pass:stu];
        }
    }
}

- (void)back {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
    [_ageTextField endEditing:YES];
    [_classTextField endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(textField == _nameTextField) {
        [_ageTextField becomeFirstResponder];
    }
    if(textField == _ageTextField){
        [_classTextField becomeFirstResponder];
    }
    if(textField == _classTextField){
        [textField resignFirstResponder];
    }
    
    return YES;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
