//
//  FirstTableViewCell.h
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell

@property UILabel *nameLabel;
@property UILabel *classLabel;
@property UILabel *ageLabel;

- (void)give:(NSIndexPath *)indexPath Arr1:(NSMutableArray *)nameArr Arr2:(NSMutableArray *)ageArr Arr3:(NSMutableArray *)classArr;

@end

NS_ASSUME_NONNULL_END
