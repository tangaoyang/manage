//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN
@class Student;
@protocol DeleteDelegate <NSObject>

- (void)deletepass1:(NSMutableArray *)nameArr pass2:(NSMutableArray *)ageArr pass3:(NSMutableArray *)classArr;

@end
@interface DeleteViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>

@property UITextField *nameTextField;
@property UITableView *tableView;
@property NSMutableArray *nameArr;
@property NSMutableArray *ageArr;
@property NSMutableArray *classArr;
@property id <DeleteDelegate> deleteDelegate;

@end

NS_ASSUME_NONNULL_END
