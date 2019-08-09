//
//  LoadViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "LoadViewController.h"
#import "RegisterViewController.h"
#import "FirstViewController.h"

@interface LoadViewController ()
<UITextFieldDelegate, RegisterViewControllerDelegate>{
    NSString *userStr;
    NSString *passStr;
    NSMutableArray *userArr;
    NSMutableArray *passArr;
}

@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backgroundImage = [UIImage imageNamed:@"背景7.jpg"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
    backgroundImageView.frame = self.view.bounds;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
    UIImage *lineImage = [UIImage imageNamed:@"竖线.png"];
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:lineImage];
    lineImageView.frame = CGRectMake(45, 10, 10, 30);
    
    UIImage *userImage = [UIImage imageNamed:@"用户.png"];
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:userImage];
    userImageView.frame = CGRectMake(0, 0, 45, 45);
    
    UIView *user_View = [[UIView alloc] init];
    user_View.frame = CGRectMake(0, 0, 55, 50);
    [user_View addSubview:userImageView];
    [user_View addSubview:lineImageView];
    
    _userTextField = [[UITextField alloc] init];
    _userTextField.placeholder = @"请输入账号";
    _userTextField.textColor = [UIColor whiteColor];
    _userTextField.tintColor = [UIColor whiteColor];
    _userTextField.borderStyle = UITextBorderStyleLine;
    _userTextField.layer.masksToBounds = YES;
    _userTextField.layer.cornerRadius = 5;
    _userTextField.layer.borderWidth = 2;
    _userTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _userTextField.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_userTextField];
    _userTextField.delegate = self;
    _userTextField.frame = CGRectMake(50, 370, 320, 55);
    _userTextField.keyboardType = UIKeyboardTypeDefault;
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    _userTextField.leftView = user_View;
    
    UIImageView *lineImageView2 = [[UIImageView alloc] initWithImage:lineImage];
    lineImageView2.frame = CGRectMake(45, 10, 10, 30);
    
    UIImage *passImage = [UIImage imageNamed:@"密码.png"];
    UIImageView *passImageView = [[UIImageView alloc] initWithImage:passImage];
    passImageView.frame = CGRectMake(0, 0, 45, 45);
    
    UIView *pass_View = [[UIView alloc] init];
    pass_View.frame = CGRectMake(0, 0, 55, 50);
    [pass_View addSubview:passImageView];
    [pass_View addSubview:lineImageView2];
    
    _passTextField = [[UITextField alloc] init];
    _passTextField.tintColor = [UIColor whiteColor];
    _passTextField.textColor = [UIColor whiteColor];
    _passTextField.placeholder = @"请输入密码";
    _passTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passTextField.layer.masksToBounds = YES;
    _passTextField.layer.cornerRadius = 5;
    _passTextField.layer.borderWidth = 2;
    _passTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:_passTextField];
    _passTextField.backgroundColor = [UIColor clearColor];
    _passTextField.delegate = self;
    _passTextField.frame = CGRectMake(50, 450, 320, 55);
    _passTextField.keyboardType = UIKeyboardTypeDefault;
    _passTextField.secureTextEntry = YES;
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    _passTextField.leftView = pass_View;
    
    _loadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _loadButton.frame = CGRectMake(80, 525, 100, 35);
    _loadButton.titleLabel.font = [UIFont systemFontOfSize:23];
    [_loadButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_loadButton addTarget:self action:@selector(pressLoad) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_loadButton];
    _loadButton.tintColor = [UIColor whiteColor];
    //    _loadButton.layer.borderColor = [UIColor blackColor].CGColor;
    //    _loadButton.layer.masksToBounds = YES;
    //    _loadButton.layer.cornerRadius = 5;
    //    _loadButton.layer.borderWidth = 2;
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:_registerButton];
    _registerButton.frame = CGRectMake(235, 525, 100, 35);
    //    _registerButton.layer.masksToBounds = YES;
    //    _registerButton.layer.cornerRadius = 5;
    //    _registerButton.layer.borderWidth = 2;
    //    _registerButton.layer.borderColor = [UIColor blackColor].CGColor;
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:23];
    _registerButton.tintColor = [UIColor whiteColor];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchDown];
    
    userArr = [[NSMutableArray alloc] init];
    [userArr addObject:@"111"];
    [userArr addObject:@"222"];
    [userArr addObject:@"333"];
    [userArr addObject:@"444"];
    passArr = [[NSMutableArray alloc] init];
    [passArr addObject:@"aaa"];
    [passArr addObject:@"sss"];
    [passArr addObject:@"ddd"];
    [passArr addObject:@"fff"];
    
}

- (void)pressLoad{
    
    int i ;
    for(i = 0; i < userArr.count; i++) {
        if([_userTextField.text isEqualToString:userArr[i]] && [_passTextField.text isEqualToString:passArr[i]]) {
            FirstViewController *firstRoot = [[FirstViewController alloc] init];
            self.view.window.rootViewController = firstRoot;
        }
    }
    if(i == userArr.count){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号与密码不匹配!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:NO completion:nil];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == _userTextField) {
        [_passTextField becomeFirstResponder];
    }
    if(textField == _passTextField) {
        [textField resignFirstResponder];
    }
    return YES;
    
}

- (void)pressRegister{
    
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    registerViewController.regiserViewControllerDelegate = self;
    registerViewController.RuserArr = userArr;
    registerViewController.RpassArr = passArr;
    [self presentViewController:registerViewController animated:NO completion:nil];
    
}

- (void)pass1:(NSString *)str1 pass2:(NSString *)str2 {
    
    _userTextField.text = str1;
    _passTextField.text = str2;
    NSLog(@"%@", userArr);
    NSLog(@"%@", passArr);
    
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
