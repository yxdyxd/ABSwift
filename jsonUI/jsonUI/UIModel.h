//
//  UIModel.h
//  jsonUI
//
//  Created by zuyu on 2020/7/14.
//  Copyright © 2020 zuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIModel : NSObject
@property(nonatomic,copy) NSString *classStr;
@property(nonatomic) SEL selector;
@property(nonatomic) CGRect frame;
@property(nonatomic,strong) UIColor *bgColor;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *cellClass;


@end

NS_ASSUME_NONNULL_END
