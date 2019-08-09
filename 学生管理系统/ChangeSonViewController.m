//
//  ChangeSonViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "ChangeSonViewController.h"

@interface ChangeSonViewController ()

@end

@implementation ChangeSonViewController

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
    _nameTextField.text = _str;
    _nameTextField.delegate = self;
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.layer.cornerRadius = 5;
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _nameTextField.tintColor = [UIColor whiteColor];
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.backgroundColor = [UIColor clearColor];
    _nameTextField.frame = CGRectMake(80, 250, 250, 50);
    _nameTextField.placeholder = @"请输入学生姓名";
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameImageView;
    [self.view addSubview:_nameTextField];
    
    UIImage *ageImage = [UIImage imageNamed:@"年龄.png"];
    UIImageView *ageImageView = [[UIImageView alloc] initWithImage:ageImage];
    ageImageView.frame = CGRectMake(3, 3, 45, 45);
    _ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 315, 250, 50)];
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
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 380, 250, 50)];
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
    
    UIButton *change = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:change];
    change.frame = CGRectMake(110, 500, 80, 30);
    change.titleLabel.font = [UIFont systemFontOfSize:25];
    [change setTitle:@"完成" forState:UIControlStateNormal];
    change.backgroundColor = [UIColor clearColor];
    change.tintColor = [UIColor whiteColor];
    [change addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchDown];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:back];
    back.frame = CGRectMake(250, 500, 80, 30);
    back.titleLabel.font = [UIFont systemFontOfSize:25];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    back.backgroundColor = [UIColor clearColor];
    back.tintColor = [UIColor whiteColor];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
}

- (void)change{
    
    int i;
    for(i = 0; i < _nameArr.count; i++){
        if([_nameArr[i] isEqualToString:_str]){
            [_nameArr replaceObjectAtIndex:i withObject:_nameTextField.text];
            [_ageArr replaceObjectAtIndex:i withObject:_ageTextField.text];
            [_classArr replaceObjectAtIndex:i withObject:_classTextField.text];
        }
    }
    if([_changeSonDelegate respondsToSelector:@selector(changeSonPass1:Pass2:Pass3:)]){
        [_changeSonDelegate changeSonPass1:_nameArr Pass2:_ageArr Pass3:_classArr];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
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
