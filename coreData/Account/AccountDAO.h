//
//  AccountDAO.h
//  coreData
//
//  Created by wansy on 15/6/4.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import "EWBaseDAO.h"
@class Account;

@interface AccountDAO : EWBaseDAO
/**
 *  查询所有
 *
 *  @return 返回实体数组
 */
-(NSMutableArray *)findAll;
/**
 *  根据主键查询
 *
 *  @param account 实体
 *
 *  @return 实体
 */
-(Account *)findById:(Account *)account;/**
 *  插入
 *
 *  @param account 实体
 */
-(void) insert:(Account *)account;
/**
 *  删除
 *
 *  @param account 实体
 */
-(void) delete:(Account *)account ;
/**
 *  修改
 *
 *  @param account 实体
 */
-(void)modify:(Account *)account;
@end
