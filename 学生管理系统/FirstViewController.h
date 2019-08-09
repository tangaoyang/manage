//
//  FirstViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@class Student;
@interface FirstViewController : UIViewController
<
addDelegate,
DeleteDelegate,
ChangeDelegate,
UITableViewDelegate,
UITableViewDataSource
>

@property UITableView *tableView;
@property NSMutableArray *nameArr;
@property NSMutableArray *ageArr;
@property NSMutableArray *classArr;
@property NSMutableArray *stuArr;

@end

NS_ASSUME_NONNULL_END
