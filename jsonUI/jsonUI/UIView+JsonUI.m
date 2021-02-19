//
//  UIView+JsonUI.m
//  jsonUI
//
//  Created by zuyu on 2020/7/14.
//  Copyright © 2020 zuyu. All rights reserved.
//

#import "UIView+JsonUI.h"
#import <objc/runtime.h>

//#import <AppKit/AppKit.h>
static char jsonCornerRadiusKey;


@implementation UIView (JsonUI)

- (NSArray *)frameArray
{
    NSArray *array = objc_getAssociatedObject(self, @selector(frameArray));
    
    if (!array) {
        array = [NSArray array];
        objc_setAssociatedObject(self, @selector(frameArray), array, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }
    return array;

}

-(CGFloat)jsonCornerRadius{
    return [objc_getAssociatedObject(self, &jsonCornerRadiusKey) floatValue];
}

- (void)setJsonCornerRadius:(CGFloat)jsonCornerRadius
{
    objc_setAssociatedObject(self, &jsonCornerRadiusKey, @(jsonCornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.cornerRadius = jsonCornerRadius;
    self.layer.masksToBounds = YES;
}
@end
