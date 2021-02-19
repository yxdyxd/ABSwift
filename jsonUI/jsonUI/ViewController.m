//
//  ViewController.m
//  jsonUI
//
//  Created by zuyu on 2020/7/14.
//  Copyright © 2020 zuyu. All rights reserved.
//

#import "ViewController.h"
#import "UIModel.h"
#import "UIView+JsonUI.h"
#import "TableViewVC.h"
#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface ViewController ()<CALayerDelegate>
{
    NSMutableArray *_subViewArray;
    
    CAShapeLayer *_layer1;
    CAShapeLayer *_layer2;
    CAShapeLayer *_layer3;
    CAShapeLayer *_layer4;
    CAShapeLayer *_layer5;

    
    NSInteger   _runtime;

    UITextField *_xxxxxxx;

}
@end

@implementation ViewController

-(instancetype)ithajs{
    
    unsigned int count = 0;
        
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i<count; i++) {
        NSString *type = [NSString stringWithFormat:@"%s",ivar_getTypeEncoding(ivars[i])];
        
        if ([type containsString:@"UITextField"]) {
                    NSLog(@" ++++ %s", ivar_getName(ivars[i]));
        }
    }
    free(ivars);
    
    

    return nil;
    
//    unsigned int outCount, i;
//
//    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
//
//
//    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
//
//    for (i = 0; i < outCount; i++) {
//
//        objc_property_t property = properties[i];
//
//        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//
//        [keys addObject:propertyName];
//
//    }
//
//    free(properties);
//
//    return keys;
    
//    NSMutableArray *methodObjs = @[].mutableCopy;
//       unsigned int methodCount = 0;
//       Method *methods = class_copyMethodList([cls class], &methodCount);
//       if (methods) {
//           for (unsigned int i =0; i <methodCount; i++) {
//               SEL sel = method_getName(methods[i]);
//               const char *name = sel_getName(sel);
//               NSString *nameString ;
//               if (name) {
//                   nameString = [NSString stringWithUTF8String:name];
//               }
////               YDClass *class = [YDClass new];
////               class.name = nameString;
////               class.sel = sel;
//               [methodObjs addObject:nameString];
//           }
//       }
//       return methodObjs;
    
}



-(void)getNewPoint
{
    CLLocationCoordinate2D coordinates0[7];
    coordinates0[0].latitude  = 30.33665;
    coordinates0[0].longitude = 120.114887;
    coordinates0[1].latitude  = 30.335970;
    coordinates0[1].longitude = 120.115341;
    coordinates0[2].latitude  = 30.335970;
    coordinates0[2].longitude = 120.114433;
    coordinates0[3].latitude  = 30.336651;
    coordinates0[3].longitude = 120.113976;
    coordinates0[4].latitude  = 30.337332;
    coordinates0[4].longitude = 120.114433;
    coordinates0[5].latitude  = 30.337332;
    coordinates0[5].longitude = 120.115341;
    coordinates0[6].latitude  = 30.336651;
    coordinates0[6].longitude = 120.115799;
        
    double initW = 170;
    
    double initH = initW * sqrt(3)/2.f;
          
    double iwx = fabs(coordinates0[0].longitude - coordinates0[3].longitude) / initW * 10;
    double ihx = fabs(coordinates0[0].latitude - coordinates0[4].latitude) / initH * 10 * sqrt(3);
          
    double iiwx = 40*iwx/10;
    double iihx = 40*ihx/10;
          
    CLLocationCoordinate2D coordinatesp2[6];

    coordinatesp2[0].latitude  = 30.335970 - iihx;
    coordinatesp2[0].longitude = 120.115341 + iiwx;
    coordinatesp2[1].latitude  = 30.335970 - iihx;
    coordinatesp2[1].longitude = 120.114433 - iiwx;
    coordinatesp2[2].latitude  = 30.336651 ;
    coordinatesp2[2].longitude = 120.113976 - iiwx *2;
    coordinatesp2[3].latitude  = 30.337332 + iihx;
    coordinatesp2[3].longitude = 120.114433 - iiwx;
    coordinatesp2[4].latitude  = 30.337332 + iihx;
    coordinatesp2[4].longitude = 120.115341 + iiwx;
    coordinatesp2[5].latitude  = 30.336651 ;
    coordinatesp2[5].longitude = 120.115799 + iiwx *2;
    
    
    
    
}




-(void)wocao
{
    CGPoint point1 = CGPointMake(290.38775634765625, 655.59114583333337);
    CGPoint point2 = CGPointMake(153.24223836263022, 655.59114583333337);
    CGPoint point3 = CGPointMake(84.093221028645829, 536.41365559895837);
    CGPoint point4 = CGPointMake(153.24223836263022, 417.23539225260419);
    CGPoint point5 = CGPointMake(290.38775634765625,417.23539225260419);
    CGPoint point6 = CGPointMake(359.53678385416669,536.41365559895837);
    
    NSArray *xArray = @[
        [NSNumber numberWithFloat:290.38775634765625],
        [NSNumber numberWithFloat:153.24223836263022],
        [NSNumber numberWithFloat:84.093221028645829],
        [NSNumber numberWithFloat:153.24223836263022],
        [NSNumber numberWithFloat:290.38775634765625],
        [NSNumber numberWithFloat:359.53678385416669],
    ];
    
    NSArray *yArray = @[
        [NSNumber numberWithFloat:655.59114583333337],
        [NSNumber numberWithFloat:655.59114583333337],
        [NSNumber numberWithFloat:536.41365559895837],
        [NSNumber numberWithFloat:417.23539225260419],
        [NSNumber numberWithFloat:417.23539225260419],
        [NSNumber numberWithFloat:536.41365559895837],
    ];
    
    CGFloat maxX = [[xArray valueForKeyPath:@"@max.floatValue"] floatValue];
    CGFloat maxY = [[yArray valueForKeyPath:@"@max.floatValue"] floatValue];
    CGFloat minX = [[xArray valueForKeyPath:@"@min.floatValue"] floatValue];
    CGFloat minY = [[yArray valueForKeyPath:@"@min.floatValue"] floatValue];

    CGRect frame = CGRectMake(minX, minY, maxX - minX, maxY - minY );
    UIView *view = [[UIView alloc] initWithFrame:frame];

    UIBezierPath *path = [[UIBezierPath alloc]init];
            

    [path moveToPoint:[self.view convertPoint:point1 toView:view]];
    [path addLineToPoint:[self.view convertPoint:point2 toView:view]];
    [path addLineToPoint:[self.view convertPoint:point3 toView:view]];
    [path addLineToPoint:[self.view convertPoint:point4 toView:view]];
    [path addLineToPoint:[self.view convertPoint:point5 toView:view]];
    [path addLineToPoint:[self.view convertPoint:point6 toView:view]];
    
    [path closePath];
        // 创建 shapeLayer
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.frame = frame;
    shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = RGBA(1, 1, 1, 0.02).CGColor;
    shapeLayer.contents  = (id)[UIImage imageNamed:@"xxxximagexx.png"].CGImage;
    shapeLayer.contentsGravity = @"resizeAspectFill";
    [self.view.layer addSublayer:shapeLayer];

    
    
    float scale2 = 1.1;

    CGRect frame2 = [self getScaleFrame:frame scale:scale2];

    UIView *view2 = [[UIView alloc] initWithFrame:frame2];

    CAShapeLayer *shapeLayer2 = [[CAShapeLayer alloc]init];
    [self.view.layer addSublayer:shapeLayer2];

    shapeLayer2.frame = frame2;

    shapeLayer2.path = path.CGPath;
    shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    shapeLayer2.strokeColor = RGBA(152, 242, 238, 0.8).CGColor;
    shapeLayer2.lineWidth = 2 / scale2;
    CATransform3D transform = CATransform3DMakeTranslation((frame2.size.width - frame.size.width) * scale2 /2,(frame2.size.height - frame.size.height) * scale2 / 2,0);
    shapeLayer2.transform = CATransform3DScale(transform, scale2, scale2, 1);
    
    
    float scale3 = 1.3;

    CGRect frame3 = [self getScaleFrame:frame scale:scale3];

    UIView *view3 = [[UIView alloc] initWithFrame:frame3];

    CAShapeLayer *shapeLayer3 = [[CAShapeLayer alloc]init];
    [self.view.layer addSublayer:shapeLayer3];

    shapeLayer3.frame = frame3;
    shapeLayer3.path = path.CGPath;
    shapeLayer3.fillColor = [UIColor clearColor].CGColor;
    shapeLayer3.strokeColor = RGBA(152, 242, 238, 0.8).CGColor;
    shapeLayer3.lineWidth = 4 / scale3;
    CATransform3D transform3 = CATransform3DMakeTranslation((frame3.size.width - frame.size.width) * scale3 /2,(frame3.size.height - frame.size.height) * scale3 / 2,0);
    shapeLayer3.transform = CATransform3DScale(transform3, scale3, scale3, 1);
    
    
    float scale4 = 1.5;

    CGRect frame4 = [self getScaleFrame:frame scale:scale4];

    UIView *view4 = [[UIView alloc] initWithFrame:frame4];
    CAShapeLayer *shapeLayer4 = [[CAShapeLayer alloc]init];
    [self.view.layer addSublayer:shapeLayer4];

    shapeLayer4.frame = frame4;
    shapeLayer4.path = path.CGPath;
    shapeLayer4.fillColor = [UIColor clearColor].CGColor;
    shapeLayer4.strokeColor = RGBA(152, 242, 238, 0.8).CGColor;
    shapeLayer4.lineWidth = 4 / scale4;
    CATransform3D transform4 = CATransform3DMakeTranslation((frame4.size.width - frame.size.width) * scale4 /2,(frame4.size.height - frame.size.height) * scale4 / 2,0);
    shapeLayer4.transform = CATransform3DScale(transform4, scale4, scale4, 1);
       
    
    
    float scale5 = 1.7;

    CGRect frame5 = [self getScaleFrame:frame scale:scale5];

    UIView *view5 = [[UIView alloc] initWithFrame:frame5];
    CAShapeLayer *shapeLayer5 = [[CAShapeLayer alloc]init];
    [self.view.layer addSublayer:shapeLayer5];

    shapeLayer5.frame = frame5;
    shapeLayer5.path = path.CGPath;
    shapeLayer5.fillColor = [UIColor clearColor].CGColor;
    shapeLayer5.strokeColor = RGBA(152, 242, 238, 0.8).CGColor;
    shapeLayer5.lineWidth = 5 / scale5;
    CATransform3D transform5 = CATransform3DMakeTranslation((frame5.size.width - frame.size.width) * scale5 /2,(frame5.size.height - frame.size.height) * scale5 / 2,0);
    shapeLayer5.transform = CATransform3DScale(transform5, scale5, scale5, 1);
       
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    _runtime = 0;
    _layer1 = shapeLayer;
    _layer2 = shapeLayer2;
    _layer3 = shapeLayer3;
    _layer4 = shapeLayer4;
    _layer5 = shapeLayer5;
//    _layer2.hidden = YES;
//    _layer3.hidden = YES;
//    _layer4.hidden = YES;
}

-(void)timerMethod
{
    
    
    if (_runtime % 5 == 0) {
        [UIView animateWithDuration:0.1 animations:^{
            _layer2.opacity = 0;
            _layer3.opacity = 0;
            _layer4.opacity = 0;
            _layer5.opacity = 0;
        }];
    }else if (_runtime % 5 == 1){
        [UIView animateWithDuration:0.1 animations:^{
            _layer2.opacity = 0.4;
            _layer3.opacity = 0;
            _layer4.opacity = 0;
            _layer5.opacity = 0;
        }];
    }else if (_runtime % 5 == 2){
        [UIView animateWithDuration:0.1 animations:^{
            _layer2.opacity = 0.4;
            _layer3.opacity = 0.6;
            _layer4.opacity = 0;
            _layer5.opacity = 0;
        }];
    }else if (_runtime % 5 == 3){
        [UIView animateWithDuration:0.1 animations:^{
            _layer2.opacity = 0;
            _layer3.opacity = 0.6;
            _layer4.opacity = 0.8;
            _layer5.opacity = 0;}];
    }else if (_runtime % 5 == 4){
        [UIView animateWithDuration:0.1 animations:^{
            _layer2.opacity = 0;
            _layer3.opacity = 0;
            _layer4.opacity = 0.8;
            _layer5.opacity = 01;
        }];
    }
    
    
    
//    if (_runtime % 8 == 0) {
////        _layer2.hidden = YES;
////        _layer3.hidden = YES;
////        _layer4.hidden = YES;
//
//        [UIView animateWithDuration:0.1 animations:^{
//            _layer2.opacity = 0;
//            _layer3.opacity = 0;
//            _layer4.opacity = 0;
//            _layer5.opacity = 0;
//        }];
//
//
//
//
////        [self wocaoAnimationLayer2:1 Layer3:1 Layer4:1];
//    }else if (_runtime % 8 == 1){
////        _layer2.hidden = NO;
////        _layer3.hidden = YES;
////        _layer4.hidden = YES;
////        [self wocaoAnimationLayer2:0 Layer3:1 Layer4:1];
//        [UIView animateWithDuration:0.1 animations:^{
//            _layer2.opacity = 1;
//            _layer3.opacity = 0;
//            _layer4.opacity = 0;
//            _layer5.opacity = 0;
//
//        }];
//
//    }else if (_runtime % 8 == 2){
////        _layer2.hidden = NO;
////        _layer3.hidden = NO;
////        _layer4.hidden = YES;
////        [self wocaoAnimationLayer2:0 Layer3:0 Layer4:1];
//        [UIView animateWithDuration:0.1 animations:^{
//            _layer2.opacity = 1;
//            _layer3.opacity = 1;
//            _layer4.opacity = 0;
//            _layer5.opacity = 0;
//
//        }];
//
//    }else if (_runtime % 8 == 3){
////        _layer2.hidden = NO;
////        _layer3.hidden = NO;
////        _layer4.hidden = NO;
////        [self wocaoAnimationLayer2:0 Layer3:0 Layer4:0];
//        [UIView animateWithDuration:0.1 animations:^{
//            _layer2.opacity = 1;
//            _layer3.opacity = 1;
//            _layer4.opacity = 1;
//            _layer5.opacity = 0;
//
//        }];
//
//    }else if (_runtime % 8 == 4){
////        _layer2.hidden = NO;
////        _layer3.hidden = NO;
////        _layer4.hidden = YES;
////        [self wocaoAnimationLayer2:0 Layer3:0 Layer4:1];
//        [UIView animateWithDuration:0.1 animations:^{
//            _layer2.opacity = 1;
//            _layer3.opacity = 1;
//            _layer4.opacity = 1;
//            _layer5.opacity = 1;
//
//        }];
//
//    }else if (_runtime % 8 == 5){
////        _layer2.hidden = NO;
////        _layer3.hidden = YES;
////        _layer4.hidden = YES;
////        [self wocaoAnimationLayer2:0 Layer3:1 Layer4:1];
//        [UIView animateWithDuration:0.1 animations:^{
//            _layer2.opacity = 1;
//            _layer3.opacity = 1;
//            _layer4.opacity = 1;
//            _layer5.opacity = 0;
//
//        }];
//
//    }else if (_runtime % 8 == 6){
//    //        _layer2.hidden = NO;
//    //        _layer3.hidden = YES;
//    //        _layer4.hidden = YES;
//    //        [self wocaoAnimationLayer2:0 Layer3:1 Layer4:1];
//            [UIView animateWithDuration:0.1 animations:^{
//                _layer2.opacity = 1;
//                _layer3.opacity = 1;
//                _layer4.opacity = 0;
//                _layer5.opacity = 0;
//
//            }];
//
//        }else if (_runtime % 8 == 7){
//        //        _layer2.hidden = NO;
//        //        _layer3.hidden = YES;
//        //        _layer4.hidden = YES;
//        //        [self wocaoAnimationLayer2:0 Layer3:1 Layer4:1];
//                [UIView animateWithDuration:0.1 animations:^{
//                    _layer2.opacity = 1;
//                    _layer3.opacity = 0;
//                    _layer4.opacity = 0;
//                    _layer5.opacity = 0;
//
//                }];
//
//            }

    _runtime++;

}
//
//-(void)wocaoOpacityAnimationLayer2:(BOOL)i Layer3:(BOOL)j Layer4:(BOOL)k
//{
//    _layer2.opacity = (_layer2.opacity == 1)?0.3:1;
//    _layer3.opacity = (_layer3.opacity == 1)?0.3:1;
//    _layer4.opacity = (_layer4.opacity == 1)?0.3:1;
//}

-(void)wocaoAnimationLayer2:(BOOL)i Layer3:(BOOL)j Layer4:(BOOL)k
{
    [UIView animateWithDuration:0.3 animations:^{
        _layer2.hidden = i;
        _layer3.hidden = j;
        _layer4.hidden = k;
       

    }];
    
//     [CATransaction begin];
//          //显式事务默认开启动画效果,kCFBooleanTrue关闭
//    [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
//
//       //动画执行时间
//    [CATransaction setValue:[NSNumber numberWithFloat:5.0f] forKey:kCATransactionAnimationDuration];
//
//    [CATransaction setAnimationDuration:1];
//
//
    
//    layer.opacity = (layer.opacity != 1.0f) ? 0.2f : 1.0f;
    
//    [CATransaction commit];
    
    
    
//    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//
//    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//
//    opacityAnimation.toValue = [NSNumber numberWithFloat:0.1];
    
    
    
    
//    _layer4.alpha = 1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self wocao];
    
    
        _subViewArray = [NSMutableArray array];
    
        // 获取文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"];
        // 将文件数据化
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
        NSError *error = nil;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    //         NSLog(@"\n%@", [error localizedDescription]);
    //   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
    //                                           options:kNilOptions
    //                                             error:nil];
    
    
        for (NSDictionary *itme in [result objectForKey:@"data"]) {
    
            UIModel *model = [[UIModel alloc] init];
            model.selector =  NSSelectorFromString([itme objectForKey:@"SEL"]);
            model.classStr = [itme objectForKey:@"class"];
            CGFloat color  = [[itme objectForKey:@"rgb"] floatValue] / 255.f;
            model.bgColor  = [UIColor colorWithRed:color green:color blue:color alpha:1];
            model.frame    = CGRectMake([[itme objectForKey:@"x"] integerValue], [[itme objectForKey:@"y"] integerValue], [[itme objectForKey:@"width"] integerValue], [[itme objectForKey:@"height"] integerValue]);
    
            model.title    = [itme objectForKey:@"title"];
    
            Class class    = NSClassFromString(model.classStr);
            id  view       = [[class alloc] init];
            [view setValue:model.bgColor forKey:@"backgroundColor"];
            [view setValue:[NSValue valueWithCGRect:model.frame] forKey:@"frame"];
    
            if ([view isKindOfClass:[UIButton class]]){
    
                [view addTarget:self action:model.selector forControlEvents:UIControlEventTouchUpInside];
                [view setTitle:model.title forState:UIControlStateNormal];
    
            }else if ([view isKindOfClass:[UILabel class]]){
                [view setValue:model.title forKey:@"text"];
                [view setValue:@(10) forKeyPath:@"layer.cornerRadius"];
                [view setValue:@(1) forKeyPath:@"layer.masksToBounds"];
    //          [view setValue:@(10) forKey:@"jsonCornerRadius"];
            }
    
            [self.view addSubview:view];
    
            [_subViewArray addObject:model];
        }
    
        NSLog(@"%@",result);
    
//    UITextField *xxxx = [[UITextField alloc] init];
//    [self.view addSubview:xxxx];
//
//    _xxxxxxx = [[UITextField alloc] init];
//    [self.view addSubview:_xxxxxxx];
//
//    [self ithajs];
//
//
//
////     NSLog(@"%@",) ;
//
//    self.view.backgroundColor = RGBA(42, 42, 42, 1);
//
    
//    CGPoint point[] = {
//        CGPointMake(221.4842529296875, 198.02012125651041),
//        CGPointMake(143.9605712890625, 198.02012125651041),
//        CGPointMake(104.87298583984375, 130.65323893229166),
//        CGPointMake(143.9605712890625, 63.28582763671875),
//        CGPointMake(221.4842529296875,63.28582763671875),
//        CGPointMake(260.57185872395831,130.65323893229166),
//        CGPointMake(221.4842529296875, 198.02012125651041)
//    };
    
//
//    CGPoint point1 = CGPointMake(221.4842529296875, 198.02012125651041);
//    CGPoint point2 = CGPointMake(143.9605712890625, 198.02012125651041);
//    CGPoint point3 = CGPointMake(104.87298583984375, 130.65323893229166);
//    CGPoint point4 = CGPointMake(143.9605712890625, 63.28582763671875);
//    CGPoint point5 = CGPointMake(221.4842529296875,63.28582763671875);
//    CGPoint point6 = CGPointMake(260.57185872395831,130.65323893229166);
//
//    NSArray *xArray = @[
//        [NSNumber numberWithFloat:221.4842529296875],
//        [NSNumber numberWithFloat:143.9605712890625],
//        [NSNumber numberWithFloat:104.87298583984375],
//        [NSNumber numberWithFloat:143.9605712890625],
//        [NSNumber numberWithFloat:221.4842529296875],
//        [NSNumber numberWithFloat:260.57185872395831],
//    ];
//
//    NSArray *yArray = @[
//        [NSNumber numberWithFloat:198.02012125651041],
//        [NSNumber numberWithFloat:198.02012125651041],
//        [NSNumber numberWithFloat:130.65323893229166],
//        [NSNumber numberWithFloat:63.28582763671875],
//        [NSNumber numberWithFloat:63.28582763671875],
//        [NSNumber numberWithFloat:130.65323893229166],
//    ];
//
//    CGFloat maxX = [[xArray valueForKeyPath:@"@max.floatValue"] floatValue];
//    CGFloat maxY = [[yArray valueForKeyPath:@"@max.floatValue"] floatValue];
//    CGFloat minX = [[xArray valueForKeyPath:@"@min.floatValue"] floatValue];
//    CGFloat minY = [[yArray valueForKeyPath:@"@min.floatValue"] floatValue];
//
//
//    NSLog(@"maxX ==  %f",maxX);
//    NSLog(@"maxY ==  %f",maxY);
//    NSLog(@"minX ==  %f",minX);
//    NSLog(@"minY ==  %f",minY);
//
//
//
//
//
//    CGRect frame = CGRectMake(minX, minY, maxX - minX, maxY - minY );
//    NSLog(@"%@" ,NSStringFromCGRect(frame))
//    ;
//
//
//    UIView *view = [[UIView alloc] initWithFrame:frame];
////    view.backgroundColor = RGBA(0, 0, 0, 0.6);
////    [self.view addSubview:view];
//    ;
//
//
//    UIBezierPath *path = [[UIBezierPath alloc]init];
//
////    [path moveToPoint:point1];
////    [path addLineToPoint:point2];
////    [path addLineToPoint:point3];
////    [path addLineToPoint:point4];
////    [path addLineToPoint:point5];
////    [path addLineToPoint:point6];
//
//    [path moveToPoint:[self.view convertPoint:point1 toView:view]];
//    [path addLineToPoint:[self.view convertPoint:point2 toView:view]];
//    [path addLineToPoint:[self.view convertPoint:point3 toView:view]];
//    [path addLineToPoint:[self.view convertPoint:point4 toView:view]];
//    [path addLineToPoint:[self.view convertPoint:point5 toView:view]];
//    [path addLineToPoint:[self.view convertPoint:point6 toView:view]];
//
//
////    [path moveToPoint:CGPointMake(221.4842529296875, 198.02012125651041)];
////    [path addLineToPoint:CGPointMake(143.9605712890625, 198.02012125651041)];
////    [path addLineToPoint:CGPointMake(104.87298583984375, 130.65323893229166)];
////    [path addLineToPoint:CGPointMake(143.9605712890625, 63.28582763671875)];
////    [path addLineToPoint:CGPointMake(221.4842529296875,63.28582763671875)];
////    [path addLineToPoint:CGPointMake(260.57185872395831,130.65323893229166)];
//
//    [path closePath];
//    // 创建 shapeLayer
//    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
//    shapeLayer.frame = frame;
////    shapeLayer.contentsCenter
////    shapeLayer.bounds = self.view.bounds;
//    shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
//    shapeLayer.path = path.CGPath;
//    shapeLayer.fillColor = [UIColor clearColor].CGColor;
//    shapeLayer.contents  = (id)[UIImage imageNamed:@"XXX.png"].CGImage;
//    shapeLayer.contentsGravity = @"center";
////    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
////    shapeLayer.lineWidth = 5;
////    shapeLayer.contents  = (id)[UIImage imageNamed:@"xxxximage.png"].CGImage;
////    shapeLayer.contentsGravity = @"center";
////    shapeLayer.transform = CATransform3DScale(CATransform3DIdentity, 1.3, 1.3, 1);
////    shapeLayer.transform = CATransform3DMakeScale(1.3,1.3,1);
//
//
//
//
//    CGRect frame2 = [self getScaleFrame:frame scale:1.3];
//
//    UIView *view2 = [[UIView alloc] initWithFrame:frame2];
////    view2.backgroundColor = RGBA(255, 165, 0, 0.3);
////    [self.view addSubview:view2];
//
//
//
////
//    NSLog(@" --- %@\n ======%@",NSStringFromCGPoint(view.center),NSStringFromCGPoint(view2.center));
////
//
//    CAShapeLayer *shapeLayer2 = [[CAShapeLayer alloc]init];
//    [self.view.layer addSublayer:shapeLayer2];
//    [self.view.layer addSublayer:shapeLayer];
//
//    shapeLayer2.frame = frame;
////    shapeLayer1.bounds = self.view.bounds;
//    shapeLayer2.anchorPoint = CGPointMake(0.5, 0.5);
//
//    shapeLayer2.path = path.CGPath;
//    shapeLayer2.fillColor = [UIColor clearColor].CGColor;
//
////    shapeLayer2.fillColor = RGBA(1, 1, 1, 0.1).CGColor;
////    shapeLayer2.strokeColor = [UIColor orangeColor].CGColor;
////    shapeLayer2.lineWidth = 5 / 1.3;
//    shapeLayer2.contents  = (id)[UIImage imageNamed:@"xx.png"].CGImage;
//    shapeLayer2.contentsGravity = @"center";
//
////    CATransform3D transform = CATransform3DMakeTranslation((frame2.size.width - frame.size.width) * 1.3 /2,(frame2.size.height - frame.size.height) * 1.3/2,0);
//////
////    shapeLayer2.transform = CATransform3DScale(transform, 1, 1.3, 1);
//
//
//
//
//
//    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    NSMutableArray *values = [NSMutableArray array];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0f)]];
//
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1.0f)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0f)]];
//    animation.values = values;
//    animation.duration = 2;
//    animation.repeatCount = __LONG_MAX__ ;
////    MAXFLOAT
////    animation.repeatDuration
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.removedOnCompletion =NO;
//    animation.fillMode =kCAFillModeForwards;
//    [shapeLayer2 addAnimation:animation forKey:@"transform"];
//
//
    
    
//    shapeLayer.transform = CATransform3DMakeTranslation(10, 10, 1);
//    shapeLayer.transform = CATransform3DMakeScale(1.3,1.3,1);

//    shapeLayer.transform = CATransform3DTranslate(shapeLayer.transform, -40, -40, 0);
    
//    shapeLayer.anchorPoint = CGPointMake(0, 0);
//
//    shapeLayer.anchorPoint = shapeLayer1.anchorPoint;
    
    
    
    
    
//    shapeLayer cornerCurveExpansionFactor
    
    
//     CALayer *layer=[[CALayer alloc]init];
//        layer.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//        layer.position = self.view.center;
//        layer.backgroundColor = [UIColor orangeColor].CGColor;
//        //注意仅仅设置圆角，对于图形而言可以正常显示，但是对于图层中绘制的图片无法正确显示
//        //如果想要正确显示则必须设置masksToBounds=YES，剪切子图层
//        layer.masksToBounds = YES;
//        //阴影效果无法和masksToBounds同时使用，因为masksToBounds的目的就是剪切外边框，
//        //而阴影效果刚好在外边框
//    //    layer.shadowColor=[UIColor grayColor].CGColor;
//    //    layer.shadowOffset=CGSizeMake(2, 2);
//    //    layer.shadowOpacity=1;
//        //设置边框
//        layer.borderColor=[UIColor orangeColor].CGColor;
//        layer.borderWidth=2;
//        //设置图层代理
//        layer.delegate=self;
//        //添加图层到根图层
//        [self.view.layer addSublayer:layer];
//        //调用图层setNeedDisplay,否则代理方法不会被调用
//        [layer setNeedsDisplay];
    
   
}

-(CGRect )getScaleFrame:(CGRect )frame scale:(CGFloat )scale
{
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    CGFloat newWidth = width * scale;
    CGFloat newHeight = height * scale;
    x = x - (newWidth - width)/2;
    y = y - (newHeight - height)/2;
    
    return CGRectMake(x, y, newWidth, newHeight);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"卧槽");
}


//{
//    _subViewArray = [NSMutableArray array];
//
//    // 获取文件路径
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"];
//    // 将文件数据化
//    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
//
//    NSError *error = nil;
//    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
////         NSLog(@"\n%@", [error localizedDescription]);
////   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
////                                           options:kNilOptions
////                                             error:nil];
//
//
//    for (NSDictionary *itme in [result objectForKey:@"data"]) {
//
//        UIModel *model = [[UIModel alloc] init];
//        model.selector =  NSSelectorFromString([itme objectForKey:@"SEL"]);
//        model.classStr = [itme objectForKey:@"class"];
//        CGFloat color  = [[itme objectForKey:@"rgb"] floatValue] / 255.f;
//        model.bgColor  = [UIColor colorWithRed:color green:color blue:color alpha:1];
//        model.frame    = CGRectMake([[itme objectForKey:@"x"] integerValue], [[itme objectForKey:@"y"] integerValue], [[itme objectForKey:@"width"] integerValue], [[itme objectForKey:@"height"] integerValue]);
//
//        model.title    = [itme objectForKey:@"title"];
//
//        Class class    = NSClassFromString(model.classStr);
//        id  view       = [[class alloc] init];
//        [view setValue:model.bgColor forKey:@"backgroundColor"];
//        [view setValue:[NSValue valueWithCGRect:model.frame] forKey:@"frame"];
//
//        if ([view isKindOfClass:[UIButton class]]){
//
//            [view addTarget:self action:model.selector forControlEvents:UIControlEventTouchUpInside];
//            [view setTitle:model.title forState:UIControlStateNormal];
//
//        }else if ([view isKindOfClass:[UILabel class]]){
//            [view setValue:model.title forKey:@"text"];
//            [view setValue:@(10) forKeyPath:@"layer.cornerRadius"];
//            [view setValue:@(1) forKeyPath:@"layer.masksToBounds"];
////          [view setValue:@(10) forKey:@"jsonCornerRadius"];
//        }
//
//        [self.view addSubview:view];
//
//        [_subViewArray addObject:model];
//    }
//
//    NSLog(@"%@",result);
//    // Do any additional setup after loading the view.
//}
//
//
//-(void)click1
//{
//    NSLog(@"%s",__func__);
//}
//
//-(void)click2
//{
//    NSLog(@"%s",__func__);
//}
//-(void)click3
//{
//
//    [self presentViewController:[[TableViewVC alloc] init] animated:YES completion:nil];
//
//    NSLog(@"%s",__func__);
//}
@end
