//
//  AddViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN
@class Student;
@protocol addDelegate <NSObject>

- (void)pass: (Student *)student;

@end

@interface AddViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *ageTextField;
@property NSMutableArray *nameArr;
@property NSMutableArray *ageArr;
@property NSMutableArray *classArr;
@property UITableView *tableView;
@property id <addDelegate> addDelegate;

@end

NS_ASSUME_NONNULL_END
