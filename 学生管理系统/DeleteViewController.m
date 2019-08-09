//
//  DeleteViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "DeleteViewController.h"
#import "FirstTableViewCell.h"

@interface DeleteViewController (){
    int i;
}

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [UIImage imageNamed:@"背景17.jpg"];
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
    _nameTextField.frame = CGRectMake(80, 530, 250, 50);
    _nameTextField.placeholder = @"请输入学生姓名";
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameImageView;
    [self.view addSubview:_nameTextField];
    
    UIButton *delete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:delete];
    delete.frame = CGRectMake(110, 700, 80, 30);
    delete.titleLabel.font = [UIFont systemFontOfSize:25];
    [delete setTitle:@"完成" forState:UIControlStateNormal];
    delete.backgroundColor = [UIColor clearColor];
    delete.tintColor = [UIColor whiteColor];
    [delete addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchDown];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:back];
    back.frame = CGRectMake(250, 700, 80, 30);
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

- (void)delete{
    for(i = 0; i < _nameArr.count; i++){
        if([_nameArr[i] isEqualToString:_nameTextField.text]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已找到此人，确认是否删除" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
                [self delete2];
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [alert addAction:cancel];
            [self presentViewController:alert animated:NO completion:nil];
            break;
        }
    }
    if(i == _nameArr.count) {
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
        [alert1 addAction:sure1];
        [self presentViewController:alert1 animated:NO completion:nil];
    }
    
}
    
- (void)delete2{
    [_nameArr removeObjectAtIndex:i];
    [_ageArr removeObjectAtIndex:i];
    [_classArr removeObjectAtIndex:i];
    [self dismissViewControllerAnimated:NO completion:nil];
    if([_deleteDelegate respondsToSelector:@selector(deletepass1:pass2:pass3:)]){
        [_deleteDelegate deletepass1:_nameArr pass2:_ageArr pass3:_classArr];
    }
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

- (void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
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
