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
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) HomeShowcaseTableViewCell *cell;
@end

@implementation HomeShowcaseTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self.navigationController setHidesBarsOnSwipe:YES];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
- (void) pan:(UIPanGestureRecognizer *)panGesture{
//    CGPoint curPoint = [panGesture locationInView:self.view];
//    CGRect rect = self.tableView.frame;
//    rect.origin.x = curPoint.x;
//    [self.tableView.layer setFrame:rect];
    
//    self.tableView.layer.position = CGPointMake(50.0f, 50.0f);
//    [self.tableView setFrame:rect];
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.duration = 3;
    
    basicAnimation.fromValue = self.tableView.layer;
    [self.tableView.layer setAnchorPoint:CGPointMake(0, 0.5)];
    basicAnimation.toValue =  self.tableView.layer;
    [self.tableView.layer addAnimation:basicAnimation forKey:@"animation"];
}
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
