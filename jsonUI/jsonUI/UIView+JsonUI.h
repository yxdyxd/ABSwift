//
//  UIView+JsonUI.h
//  jsonUI
//
//  Created by zuyu on 2020/7/14.
//  Copyright © 2020 zuyu. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JsonUI)

@property (nonatomic, strong) NSArray *frameArray;

@property (nonatomic, assign) CGFloat jsonCornerRadius;

@end

NS_ASSUME_NONNULL_END
