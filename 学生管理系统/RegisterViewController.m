//
//  RegisterViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController (){
    NSArray *numArr;
    NSArray *nameArr;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImage *backgroundImage = [UIImage imageNamed:@"背景7.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backgroundImageView.frame = self.view.bounds;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    UIImage *messImage = [UIImage imageNamed:@"邮箱.png"];
    UIImageView *messImageView = [[UIImageView alloc] initWithImage:messImage];
    messImageView.frame = CGRectMake(5, 0, 40, 40);
    UIImage *lineImage = [UIImage imageNamed:@"竖线.png"];
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:lineImage];
    lineImageView.frame = CGRectMake(45, 10, 10, 30);
    UIView *mess_View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 50)];
    [mess_View addSubview:lineImageView];
    [mess_View addSubview:messImageView];
    
    _messTextField = [[UITextField alloc] init];
    [self.view addSubview:_messTextField];
    _messTextField.delegate = self;
    _messTextField.tintColor = [UIColor whiteColor];
    _messTextField.textColor = [UIColor whiteColor];
    _messTextField.placeholder = @"请输入你的邮箱";
    _messTextField.layer.masksToBounds = YES;
    _messTextField.layer.cornerRadius = 5;
    _messTextField.layer.borderWidth = 2;
    _messTextField.frame = CGRectMake(50, 300, 300, 55);
    _messTextField.borderStyle = UITextBorderStyleRoundedRect;
    _messTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _messTextField.backgroundColor = [UIColor clearColor];
    _messTextField.leftViewMode = UITextFieldViewModeAlways;
    _messTextField.leftView = mess_View;
    
    UIImage *userImage = [UIImage imageNamed:@"用户.png"];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    userImageView.frame = CGRectMake(5, 0, 40, 40);
    UIImageView *lineView2 = [[UIImageView alloc] initWithImage:lineImage];
    lineView2.frame = CGRectMake(45, 10, 10, 30);
    UIView *user_View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 50)];
    [user_View addSubview:lineView2];
    [user_View addSubview:userImageView];
    
    _userTextField = [[UITextField alloc] init];
    [self.view addSubview:_userTextField];
    _userTextField.delegate = self;
    _userTextField.tintColor = [UIColor whiteColor];
    _userTextField.textColor = [UIColor whiteColor];
    _userTextField.placeholder = @"请输入账号";
    _userTextField.backgroundColor = [UIColor clearColor];
    _userTextField.frame = CGRectMake(50, 375, 300, 55);
    _userTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userTextField.layer.masksToBounds = YES;
    _userTextField.layer.cornerRadius = 5;
    _userTextField.layer.borderWidth = 2;
    _userTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    _userTextField.leftView = user_View;
    
    UIImage *passImage = [UIImage imageNamed:@"密码.png"];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    passImageView.frame = CGRectMake(5, 0, 40, 40);
    UIImageView *lineImageView3 = [[UIImageView alloc] initWithImage:lineImage];
    lineImageView3.frame = CGRectMake(45, 10, 10, 30);
    UIView *pass_View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 55, 50)];
    [pass_View addSubview:passImageView];
    [pass_View addSubview:lineImageView3];
    
    _passTextField = [[UITextField alloc] init];
    [self.view addSubview:_passTextField];
    _passTextField.delegate = self;
    _passTextField.secureTextEntry = YES;
    _passTextField.tintColor = [UIColor whiteColor];
    _passTextField.textColor = [UIColor whiteColor];
    _passTextField.placeholder = @"请输入密码";
    _passTextField.keyboardType = UIKeyboardTypeDefault;
    _passTextField.layer.masksToBounds = YES;
    _passTextField.layer.cornerRadius = 5;
    _passTextField.layer.borderWidth = 2;
    _passTextField.backgroundColor = [UIColor clearColor];
    _passTextField.frame = CGRectMake(50, 450, 300, 55);
    _passTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    _passTextField.leftView = pass_View;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:button];
    [button setTitle:@"返回登陆" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:23];
    button.tintColor = [UIColor whiteColor];
    button.layer.backgroundColor = [UIColor clearColor].CGColor;
    button.frame = CGRectMake(195, 530, 100, 50);
    [button addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchDown];
    
    UIButton *Rbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:Rbutton];
    [Rbutton setTitle:@"注册" forState:UIControlStateNormal];
    Rbutton.titleLabel.font = [UIFont systemFontOfSize:23];
    Rbutton.tintColor = [UIColor whiteColor];
    Rbutton.layer.backgroundColor = [UIColor clearColor].CGColor;
    Rbutton.frame = CGRectMake(85, 530, 100, 50);
    [Rbutton addTarget:self action:@selector(pressRBtn) forControlEvents:UIControlEventTouchDown];
    
    
}

- (void)pressBtn{
    
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:NO completion:nil];
    if([_regiserViewControllerDelegate respondsToSelector:@selector(pass1:pass2:)]) {
        [_regiserViewControllerDelegate pass1:_userTextField.text pass2:_passTextField.text];
    }
    
}

- (void)pressRBtn{
    
    int i;
    for(i = 0; i < _RuserArr.count; i++){
        if([_userTextField.text isEqualToString:_RuserArr[i]]){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号重复！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:sure];
            [self presentViewController:alert animated:NO completion:nil];
            break;
        }
    }
    if(i == _RuserArr.count){
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功，请重新登录！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil];
        [alert1 addAction:sure1];
        [self presentViewController:alert1 animated:NO completion:nil];
        [_RuserArr addObject:_userTextField.text];
        [_RpassArr addObject:_passTextField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(textField == _messTextField) {
        [_userTextField becomeFirstResponder];
    }
    if(textField == _userTextField){
        [_passTextField becomeFirstResponder];
    }
    if(textField == _passTextField){
        [textField resignFirstResponder];
    }
    
    return YES;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [_messTextField endEditing:YES];
    [_passTextField endEditing:YES];
    [_userTextField endEditing:YES];
    
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
