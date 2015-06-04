//
//  ViewController.m
//  coreData
//
//  Created by wansy on 15/6/4.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"
#import "AccountDAO.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *nickName;

- (IBAction)insert:(id)sender;
- (IBAction)delete:(id)sender;
- (IBAction)modify:(id)sender;
- (IBAction)findAll:(id)sender;
- (IBAction)findById:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)insert:(id)sender {
    AccountDAO *accountDAO =[[AccountDAO alloc] init];
    Account *account = [[Account alloc] init];
    account.userName = self.userName.text;
    account.password = self.password.text;
    account.nickName = self.nickName.text;
    
    [accountDAO insert:account];
}

- (IBAction)delete:(id)sender {
    AccountDAO *accountDAO =[[AccountDAO alloc] init];
    Account *account = [[Account alloc] init];
    account.userName = self.userName.text;
    
    [accountDAO delete:account];
}

- (IBAction)modify:(id)sender {
    AccountDAO *accountDAO =[[AccountDAO alloc] init];
    Account *account = [[Account alloc] init];
    account.userName = self.userName.text;
    account.password = self.password.text;
    account.nickName = self.nickName.text;
    
    [accountDAO modify:account];
}

- (IBAction)findAll:(id)sender {
    AccountDAO *accountDAO =[[AccountDAO alloc] init];
    
    NSMutableArray *list= [accountDAO findAll];
    
    for (Account *account in list) {
        NSLog(@"%@-%@-%@",account.userName,account.password,account.nickName);
    }
}

- (IBAction)findById:(id)sender {
    AccountDAO *accountDAO =[[AccountDAO alloc] init];
    Account *account = [[Account alloc] init];
    account.userName = self.userName.text;
    
    Account *resAccount = [accountDAO findById:account];
    NSLog(@"%@-%@-%@",resAccount.userName,resAccount.password,resAccount.nickName);
}
@end
