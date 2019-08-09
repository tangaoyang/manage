//
//  ChangeSonViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ChangeSonDelegate <NSObject>

- (void)changeSonPass1:(NSMutableArray *)nameArr Pass2:(NSMutableArray *)ageArr Pass3:(NSMutableArray *)classArr;

@end

@interface ChangeSonViewController : UIViewController
<
UITextFieldDelegate
>

@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *ageTextField;
@property NSMutableArray *nameArr;
@property NSMutableArray *ageArr;
@property NSMutableArray *classArr;
@property NSString *str;
@property id <ChangeSonDelegate> changeSonDelegate;

@end

NS_ASSUME_NONNULL_END
