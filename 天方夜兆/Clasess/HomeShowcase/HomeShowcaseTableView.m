//
//  HomeShowcaseTableView.m
//  天方夜兆
//
//  Created by 刘文强 on 16/4/20.
//  Copyright © 2016年 TianFangYeZhao. All rights reserved.
//

#import "HomeShowcaseTableView.h"
#import "HomeShowcaseTableViewCell.h"
@interface HomeShowcaseTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) HomeShowcaseTableViewCell *cell;
@end

@implementation HomeShowcaseTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self.navigationController setHidesBarsOnSwipe:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellstr = @"homeShowCell";
    _cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    [_cell.headPortraitButtonImage setBackgroundColor:[UIColor redColor]];
    _cell.textMessage.text = @"测试";
    // Configure the cell...
    return _cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}
@end
