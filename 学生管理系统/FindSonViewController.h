//
//  FindSonViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FindSonViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@property UILabel *label1;
@property UITableView *tableView;
@property NSMutableArray *nameArr;
@property NSMutableArray *ageArr;
@property NSMutableArray *classArr;

@end

NS_ASSUME_NONNULL_END
