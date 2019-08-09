//
//  RegisterViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterViewControllerDelegate <NSObject>

- (void)pass1:(NSString *)str1 pass2:(NSString *)str2;

@end

@interface RegisterViewController : UIViewController
<
UITextFieldDelegate
>

@property (nonatomic, weak) id <RegisterViewControllerDelegate> regiserViewControllerDelegate;

@property UITextField *messTextField;
@property UITextField *userTextField;
@property UITextField *passTextField;
@property NSMutableArray *RuserArr;
@property NSMutableArray *RpassArr;


@end

NS_ASSUME_NONNULL_END
