//
//  LoginViewController.m
//  天方夜兆
//
//  Created by 刘文强 on 16/4/19.
//  Copyright © 2016年 TianFangYeZhao. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "TFUserOperation.h"
#import "TFTableShowPageViewController.h"
#import "stateConstant.h"
@interface LoginViewController ()

@property (nonatomic, strong) UITextField *userNameField;

@property (nonatomic, strong) UITextField *userPasswordField;

@property (nonatomic, strong) TFUserOperation *oper;
@end

@implementation LoginViewController

- (void)viewDidLoad {

    UIImage *image = [UIImage imageNamed:@"Login_backgrund"];
    self.navigationItem.title = @"登陆";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    
    
    CGFloat heigh = 44.0;
    
    CGFloat imageY = self.navigationController.navigationBar.frame.size.height;
    //appLog
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, imageY, SCREEN_SIZE.width - 20, SCREEN_SIZE.height/3)];
    imageView.image = [UIImage imageNamed:@"Login_log"];
    [self.view addSubview:imageView];
    
    
    //邮箱
    UITextField *usernameField = [[UITextField alloc] initWithFrame:CGRectMake(50, SCREEN_SIZE.height - imageY - 20 - (heigh + 40)*3, SCREEN_SIZE.width - 100, heigh)];
    usernameField.placeholder = @"用户名";
    usernameField.textAlignment = NSTextAlignmentCenter;
    usernameField.layer.borderWidth = 1.0;
    usernameField.layer.borderColor = [UIColor whiteColor].CGColor;
    usernameField.layer.cornerRadius = 20.0;
    [self.view addSubview:usernameField];
    self.userNameField = usernameField;
    
    //密码
    UITextField *passwordField = [[UITextField alloc] initWithFrame:CGRectMake(50,SCREEN_SIZE.height - imageY - 20 - (heigh + 40)*2, SCREEN_SIZE.width - 100, heigh)];
    passwordField.placeholder = @"密码";
    passwordField.secureTextEntry = YES;
    passwordField.textAlignment = NSTextAlignmentCenter;
    passwordField.layer.borderWidth = 1.0;
    passwordField.layer.borderColor = [UIColor whiteColor].CGColor;
    passwordField.layer.cornerRadius = 20.0;
    [self.view addSubview:passwordField];
    self.userPasswordField = passwordField;
    
    //登陆
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(50,SCREEN_SIZE.height - imageY - heigh - 40 - 20, SCREEN_SIZE.width - 100, heigh)];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn setImage:[UIImage imageNamed:@"Login_Btn"] forState:UIControlStateNormal];
    loginBtn.layer.borderWidth = 1.0;
    loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    loginBtn.layer.cornerRadius = 20.0;
    [loginBtn addTarget:self action:@selector(logAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //注册
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, SCREEN_SIZE.height - imageY - 20, SCREEN_SIZE.width - 100, heigh)];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setImage:[UIImage imageNamed:@"Login_Btn"] forState:UIControlStateNormal];
    registerBtn.layer.borderWidth = 1.0;
    registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    registerBtn.layer.cornerRadius = 20.0;
    [registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    _oper = [[TFUserOperation alloc]init];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
#pragma mark -验证登陆
- (void) loginOperation:(NSNotification *)notification{
    int oper = [([notification userInfo][@"oper"]) intValue];
    if (oper == 1) {
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"TFTableShowPageViewController" bundle:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_STATE object:nil userInfo:@{LOGIN_STATE:@LOGIN_STATE_YES}];
        TFTableShowPageViewController *tab = [[TFTableShowPageViewController alloc] init];
        [self presentViewController:tab animated:YES completion:nil];
    }else{
        [self presentViewController:[self loginAlert:oper]  animated:YES completion:nil];
    }
}
#pragma mark -登陆
- (void)logAction:(UIButton *)btn {

    if ([_oper operationEmail:self.userNameField.text]) {
        
        
        if ([_oper operationPassword:self.userPasswordField.text]) {
            
            [_oper loginUserName:self.userNameField.text password:self.userPasswordField.text];
                 
        }else{
            [self.navigationController popViewControllerAnimated:YES];
            self.userPasswordField.placeholder = @"请输入6位密码";
        }
        
    }else{
        self.userNameField.text = @"";
        self.userNameField.placeholder = @"请输入正确邮箱";
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginOperation:) name:@"notificationLoginOperation" object:nil];
}
#pragma mark -注册
- (void)registerAction:(UIButton *)btn{
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIAlertController *) loginAlert:(NSInteger)operation{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"信息框" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    return alert;
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
