//
//  FindViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface FindViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>

@property UITextField *nameTextField;
@property UITableView *tableView;
@property UITextField *classTextField;
@property UITextField *ageTextField;
@property NSMutableArray *nameArr;
@property NSMutableArray *ageArr;
@property NSMutableArray *classArr;
@property NSMutableArray *snameArr;
@property NSMutableArray *sageArr;
@property NSMutableArray *sclassArr;

@end

NS_ASSUME_NONNULL_END
