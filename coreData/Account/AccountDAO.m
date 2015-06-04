//
//  AccountDAO.m
//  coreData
//
//  Created by wansy on 15/6/4.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import "AccountDAO.h"
#import "EWAccountManageObject.h"
#import "Account.h"

@implementation AccountDAO
/**
 *  查询所有
 *
 *  @return 返回实体数组
 */
-(NSMutableArray *)findAll{
    
    NSArray *listData = [self findAllWithEntityName:@"Accounts" andSortKey:@"userName"];
       
    NSMutableArray *resListData = [[NSMutableArray alloc] init];
    
    for (EWAccountManageObject *mo in listData) {
        Account *account = [[Account alloc] init];
        account.userName = mo.userName;
        account.password = mo.password;
        account.nickName = mo.nickName;
        [resListData addObject:account];
    }
    
    return resListData;
}

/**
 *  根据主键查询
 *
 *  @param account 实体
 *
 *  @return 实体
 */
-(Account *)findById:(Account *)account{
    EWAccountManageObject *mo = [self findByIdWithEntityName:@"Accounts" andKey:@"userName" andId:account.userName];
    
    if (mo) {
        Account *account = [[Account alloc] init];
        account.userName = mo.userName;
        account.password = mo.password;
        account.nickName = mo.nickName;
        return account;
    }
    return nil;
}
/**
 *  插入
 *
 *  @param account 实体
 */
-(void) insert:(Account *)account{

    EWAccountManageObject *amo = [self insertWithEntityName:@"Accounts"];
    
    [amo setValue:account.userName forKey:@"userName"];
    [amo setValue:account.password forKey:@"password"];
    [amo setValue:account.nickName forKey:@"nickName"];
    
//    amo.userName = account.userName;
//    amo.password = account.password;
//    amo.password = account.nickName;
    
    NSError *saveError = nil;
    if ([self.managedObjectContext save:&saveError]) {
        NSLog(@"插入数据成功");
    }else{
        NSLog(@"插入数据失败");
    }
}
/**
 *  删除
 *
 *  @param account 实体
 */
-(void) delete:(Account *)account {
    [self deleteWithEntityName:@"Accounts" andKey:@"userName" andId:account.userName];
}
/**
 *  修改
 *
 *  @param account 实体
 */
-(void)modify:(Account *)account{
    EWAccountManageObject *mo = [self modifyWWithEntityName:@"Accounts" andKey:@"userName" andId:account.userName];
    
    if (mo) {
        mo.password = account.password;
        mo.nickName = account.nickName;
        
        NSError *saveError = nil;
        if ([self.managedObjectContext save:&saveError]) {
            NSLog(@"修改数据成功");
        }else{
            NSLog(@"修改数据失败");
        }
    }
}

@end
