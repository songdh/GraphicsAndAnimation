//
//  ViewController.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/21.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _items = @[@{@"title":@"绘制字符串",@"class":@"View1"},
               @{@"title":@"颜色选择器",@"class":@"View2"},
               @{@"title":@"绘制图片",@"class":@"View3"},
               @{@"title":@"折线连接样式",@"class":@"View4"},
               @{@"title":@"绘制线条",@"class":@"View5"},
               @{@"title":@"图形阴影",@"class":@"View6"},
               @{@"title":@"渐变色",@"class":@"View7"},
               @{@"title":@"平移",@"class":@"View8"},
               @{@"title":@"绘制曲线",@"class":@"View9"},
               @{@"title":@"动画",@"class":@"ViewController2"}];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = self.items[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = dictionary[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictionary = self.items[indexPath.row];
    NSString *className = dictionary[@"class"];
    NSString *title = dictionary[@"title"];
    if ([className rangeOfString:@"ViewController"].location != NSNotFound) {
        
        BaseViewController *controller = [[NSClassFromString(className) alloc]init];
        controller.title = title;
        [self.navigationController pushViewController:controller animated:YES];
        
    }else{
        
        ViewController1 *controller = [[ViewController1 alloc]init];
        controller.title = title;
        controller.viewName = className;
        
        [self.navigationController pushViewController:controller animated:YES];
    }

    
}
@end
