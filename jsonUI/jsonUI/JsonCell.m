//
//  JsonCell.m
//  jsonUI
//
//  Created by zuyu on 2020/7/14.
//  Copyright © 2020 zuyu. All rights reserved.
//

#import "JsonCell.h"

@interface JsonCell()
{
    UILabel *_lable1;
    UILabel *_lable2;

}
@end
@implementation JsonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
        _lable1.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_lable1];
        
        _lable2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 300, 50)];
        _lable2.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_lable2];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _lable2.text = title;
    _lable1.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
