//
//  TableViewVC.m
//  jsonUI
//
//  Created by zuyu on 2020/7/14.
//  Copyright © 2020 zuyu. All rights reserved.
//

#import "TableViewVC.h"
#import "UIModel.h"

@interface TableViewVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
    NSInteger       _tableTag;
    UIModel        *_model;
}
@end

@implementation TableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"table" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSDictionary *itme = [result objectForKey:@"data"][0];
    
    float x      = [[itme objectForKey:@"x"] integerValue];
    float y      = [[itme objectForKey:@"y"] integerValue];
    float width  = [[itme objectForKey:@"width"] integerValue];
    float height = [[itme objectForKey:@"height"] integerValue];
    
    if (width < 0) {
        width = [UIScreen mainScreen].bounds.size.width;
    }
    
    if (height < 0) {
        height = [UIScreen mainScreen].bounds.size.height;
    }
    
    _model = [[UIModel alloc] init];
   
    _model.selector =  NSSelectorFromString([itme objectForKey:@"SEL"]);
    _model.classStr = [itme objectForKey:@"class"];
    CGFloat color  = [[itme objectForKey:@"rgb"] floatValue] / 255.f;
    _model.bgColor  = [UIColor colorWithRed:color green:color blue:color alpha:1];
    _model.title    = [itme objectForKey:@"title"];
    CGRect frame = CGRectMake(x, y, width, height);
    _model.frame    = frame;
    _model.cellClass = [itme objectForKey:@"cell"];
    
    Class class    = NSClassFromString(_model.classStr);
    id  view       = [[class alloc] init];
    
    [view setValue:_model.bgColor forKey:@"backgroundColor"];
    [view setValue:[NSValue valueWithCGRect:frame] forKey:@"frame"];

    _tableTag = [[itme objectForKey:@"tag"] integerValue];
    [view setValue:@(_tableTag) forKey:@"tag"];

    if ([view isKindOfClass:[UITableView class]] ) {
        [view setValue:self forKey:@"delegate"];
        [view setValue:self forKey:@"dataSource"];
        [view setValue:@([[itme objectForKey:@"rowHeight"] integerValue]) forKey:@"rowHeight"];
        [self requesetData];
    }
    
    
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}

-(void)requesetData
{
    _dataArray = [NSMutableArray array];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (int i = 0; i < 20; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"---------   %ld",i]];
        }
        
        UITableView *tableView = (UITableView *)[self.view viewWithTag:_tableTag];
        
        [tableView reloadData];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell = [tableView dequeueReusableCellWithIdentifier:_model.cellClass];
   
    if (cell == nil) {
        Class cellClass = NSClassFromString(_model.cellClass);
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_model.cellClass];
    }
    
    [cell setValue:_dataArray[indexPath.row] forKey:@"title"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%@",indexPath);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
