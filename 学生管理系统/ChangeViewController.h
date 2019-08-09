//
//  ChangeViewController.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeSonViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ChangeDelegate <NSObject>

- (void)changePass1:(NSMutableArray *)nameArr Pass2:(NSMutableArray *)ageArr Pass3:(NSMutableArray *)classArr;

@end

@interface ChangeViewController : UIViewController
<
ChangeSonDelegate,
UITableViewDataSource,
UITableViewDelegate
>

@property UITextField *nameTextField;
@property UITableView *tableView;
@property NSMutableArray *nameArr;
@property NSMutableArray *ageArr;
@property NSMutableArray *classArr;
@property id <ChangeDelegate> changeDelegate;

@end

NS_ASSUME_NONNULL_END
