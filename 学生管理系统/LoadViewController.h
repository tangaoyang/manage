//
//  LoadViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoadViewController : UIViewController
<
UITextFieldDelegate,
RegisterViewControllerDelegate
>

@property UITextField *userTextField;
@property UITextField *passTextField;
@property UIButton *loadButton;
@property UIButton *registerButton;
@end

NS_ASSUME_NONNULL_END
