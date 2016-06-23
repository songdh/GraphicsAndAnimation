//
//  ViewController2.m
//  GraphicsAndAnimation
//
//  Created by 宋东昊 on 16/6/22.
//  Copyright © 2016年 songdh. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _items = @[@{@"title":@"移动视图",@"class":@"ViewController3"},
               @{@"title":@"相对运动",@"class":@"ViewController4"},
               @{@"title":@"缩放动画",@"class":@"ViewController5"},
               @{@"title":@"旋转动画",@"class":@"ViewController6"}];
    
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
    
    
    BaseViewController *controller = [[NSClassFromString(className) alloc]init];
    controller.title = title;
    [self.navigationController pushViewController:controller animated:YES];
    
}
@end
