//
//  FindViewController.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "FindViewController.h"
#import "FindSonViewController.h"
#import "FirstTableViewCell.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImage *backImage = [UIImage imageNamed:@"背景17.jpg"];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    [self.view insertSubview:backImageView atIndex:0];
    
    UIImage *nameImage = [UIImage imageNamed:@"姓名.png"];
    UIImageView *nameImageView = [[UIImageView alloc] initWithImage:nameImage];
    nameImageView.frame = CGRectMake(3, 3, 40, 40);
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.layer.masksToBounds = YES;
    _nameTextField.layer.cornerRadius = 5;
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _nameTextField.tintColor = [UIColor whiteColor];
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.backgroundColor = [UIColor clearColor];
    _nameTextField.frame = CGRectMake(80, 565, 250, 50);
    _nameTextField.placeholder = @"请输入学生姓名";
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameImageView;
    [self.view addSubview:_nameTextField];
    
    UIImage *ageImage = [UIImage imageNamed:@"年龄.png"];
    UIImageView *ageImageView = [[UIImageView alloc] initWithImage:ageImage];
    ageImageView.frame = CGRectMake(3, 3, 40, 40);
    _ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 630, 250, 50)];
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
    classImageView.frame = CGRectMake(3, 3, 40, 40);
    _classTextField = [[UITextField alloc] initWithFrame:CGRectMake(80, 700, 250, 50)];
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
    
    UIButton *find = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:find];
    find.frame = CGRectMake(110, 770, 80, 30);
    find.titleLabel.font = [UIFont systemFontOfSize:25];
    [find setTitle:@"完成" forState:UIControlStateNormal];
    find.backgroundColor = [UIColor clearColor];
    find.tintColor = [UIColor whiteColor];
    [find addTarget:self action:@selector(find) forControlEvents:UIControlEventTouchDown];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:back];
    back.frame = CGRectMake(250, 770, 80, 30);
    back.titleLabel.font = [UIFont systemFontOfSize:25];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    back.backgroundColor = [UIColor clearColor];
    back.tintColor = [UIColor whiteColor];
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

- (void)find{
    
    _snameArr = [[NSMutableArray alloc] init];
    _sageArr = [[NSMutableArray alloc] init];
    _sclassArr = [[NSMutableArray alloc] init];
    BOOL find = NO;
    int i = 0;
    int j;
    int t;
    if((_nameTextField.text.length > 0) && (_ageTextField.text.length <= 0) && (_classTextField.text.length <= 0)){
        for(i = 0; i < _nameArr.count; i++){
            if([_nameArr[i] isEqualToString:_nameTextField.text]){
                find = YES;
                [_snameArr addObject:_nameArr[i]];
                [_sageArr addObject:_ageArr[i]];
                [_sclassArr addObject:_classArr[i]];
            }
        }
        if(find == NO) {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示"   message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:NO completion:nil];
        }
    }
    
    if((_ageTextField.text.length > 0) && (_nameTextField.text.length <= 0) && (_classTextField.text.length <= 0)){
        for(j = 0; j < _ageArr.count; j++){
            if([_ageArr[j] isEqualToString:_ageTextField.text]){
                find = YES;
                [_snameArr addObject:_nameArr[j]];
                [_sageArr addObject:_ageArr[j]];
                [_sclassArr addObject:_classArr[j]];
            }
        }
        if(find == NO) {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:NO completion:nil];
        }
    }
    
    if((_classTextField.text.length > 0) && (_ageTextField.text.length <= 0) && (_nameTextField.text.length <= 0)){
        for(t = 0; t < _classArr.count; t++){
            if([_classArr[t] isEqualToString:_classTextField.text]){
                find = YES;
                [_snameArr addObject:_nameArr[t]];
                [_sageArr addObject:_ageArr[t]];
                [_sclassArr addObject:_classArr[t]];
            }
        }
        if(find == NO) {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:NO completion:nil];
        }
    }
    if((_nameTextField.text.length > 0) && (_ageTextField.text.length > 0) && (_classTextField.text.length <= 0)){
        for(i = 0; i < _nameArr.count; i++){
            if([_nameArr[i] isEqualToString:_nameTextField.text] && [_ageArr[i] isEqualToString:_ageTextField.text]){
                find = YES;
                [_snameArr addObject:_nameArr[i]];
                [_sageArr addObject:_ageArr[i]];
                [_sclassArr addObject:_classArr[i]];
            }
        }
        if(find == NO) {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示"   message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:NO completion:nil];
        }
    }
    if((_nameTextField.text.length > 0) && (_classTextField.text.length > 0) && (_ageTextField.text.length <= 0)){
        for(i = 0; i < _nameArr.count; i++){
            if([_nameArr[i] isEqualToString:_nameTextField.text] && [_classArr[i] isEqualToString:_classTextField.text]){
                find = YES;
                [_snameArr addObject:_nameArr[i]];
                [_sageArr addObject:_ageArr[i]];
                [_sclassArr addObject:_classArr[i]];
            }
        }
        if(find == NO) {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示"   message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:NO completion:nil];
        }
    }
    if((_classTextField.text.length > 0) && (_ageTextField.text.length > 0) && (_nameTextField.text.length <= 0)){
        for(i = 0; i < _nameArr.count; i++){
            if([_classArr[i] isEqualToString:_classTextField.text] && [_ageArr[i] isEqualToString:_ageTextField.text]){
                find = YES;
                [_snameArr addObject:_nameArr[i]];
                [_sageArr addObject:_ageArr[i]];
                [_sclassArr addObject:_classArr[i]];
            }
        }
        if(find == NO) {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示"   message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:NO completion:nil];
        }
    }
    if((_nameTextField.text.length > 0) && (_classTextField.text.length > 0) && (_ageTextField.text.length > 0)){
        for(i = 0; i < _nameArr.count; i++){
            if([_nameArr[i] isEqualToString:_nameTextField.text] && [_classArr[i] isEqualToString:_classTextField.text] && [_ageArr[i] isEqualToString:_ageTextField.text]){
                find = YES;
                [_snameArr addObject:_nameArr[i]];
                [_sageArr addObject:_ageArr[i]];
                [_sclassArr addObject:_classArr[i]];
            }
        }
        if(find == NO) {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示"   message:@"没找到此人，请确认是否输入正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"sure" style:UIAlertActionStyleDefault handler:nil];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:NO completion:nil];
        }
    }
    if(find == YES){
        FindSonViewController *sonRoot = [[FindSonViewController alloc] init];
        sonRoot.nameArr = _snameArr;
        sonRoot.ageArr = _sageArr;
        sonRoot.classArr = _sclassArr;
        [self presentViewController:sonRoot animated:NO completion:nil];
    }
}

- (void)back{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField endEditing:YES];
    [_ageTextField endEditing:YES];
    [_classTextField endEditing:YES];
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
