//
//  FirstTableViewCell.m
//  学生管理系统
//
//  Created by cinderella on 2019/8/7.
//  Copyright © 2019 cinderella. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)give:(NSIndexPath *)indexPath Arr1:(NSMutableArray *)nameArr Arr2:(NSMutableArray *)ageArr Arr3:(NSMutableArray *)classArr {
    self.nameLabel.text = nameArr[indexPath.row];
    self.ageLabel.text = ageArr[indexPath.row];
    self.classLabel.text = classArr[indexPath.row];
    self.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLabel];
    
    _classLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_classLabel];
    
    _ageLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_ageLabel];
    
    return self;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(5, 25, 100, 20);
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.textColor = [UIColor whiteColor];
    
    _classLabel.frame = CGRectMake(120, 25, 150, 20);
    _classLabel.font = [UIFont systemFontOfSize:20];
    _classLabel.textAlignment = NSTextAlignmentCenter;
    _classLabel.textColor = [UIColor whiteColor];
    
    _ageLabel.frame = CGRectMake(300, 25, 50, 20);
    _ageLabel.font = [UIFont systemFontOfSize:20];
    _ageLabel.textAlignment = NSTextAlignmentCenter;
    _ageLabel.textColor = [UIColor whiteColor];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
