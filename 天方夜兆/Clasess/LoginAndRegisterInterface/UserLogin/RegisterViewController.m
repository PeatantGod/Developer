//
//  RegisterViewController.m
//  天方夜兆
//
//  Created by 刘文强 on 16/4/19.
//  Copyright © 2016年 TianFangYeZhao. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginHeader.h"
#import "TFUserOperation.h"
@interface RegisterViewController ()
@property (nonatomic, strong) UITextField *userNameField;

@property (nonatomic, strong) UITextField *userPasswordField;

@property (nonatomic, strong) NSDate *userRegisterDateField;

@property (nonatomic, strong) TFUserOperation *user;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"Login_backgrund"];
    self.navigationItem.title = @"注册";
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
    
    //注册
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, SCREEN_SIZE.height - imageY - 20 - (heigh + 40), SCREEN_SIZE.width - 100, heigh)];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setImage:[UIImage imageNamed:@"Login_Btn"] forState:UIControlStateNormal];
    registerBtn.layer.borderWidth = 1.0;
    registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    registerBtn.layer.cornerRadius = 20.0;
    [registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    self.user = [[TFUserOperation alloc] init];
    // Do any additional setup after loading the view.
}
- (void)registerAction:(UIButton *)btn{
    
    self.userRegisterDateField = [NSDate date];
    if ([self.user operationEmail:self.userNameField.text]) {
        if ([self.user operationPassword:self.userPasswordField.text]) {
            [self.user registerUserName:self.userNameField.text password:self.userPasswordField.text registerDate:self.userRegisterDateField];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            self.userPasswordField.text = @"";
            self.userPasswordField.placeholder = @"请输入6位密码";
        }
    }else{
        self.userNameField.text = @"";
        self.userNameField.placeholder = @"请输入正确邮箱";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
