//
//  EWBaseDAO.h
//  coreData
//
//  Created by wansy on 15/6/4.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import "CoreDataDAO.h"
@class Account;

@interface EWBaseDAO : CoreDataDAO

/**
 *  查询所有
 */
-(NSArray *)findAllWithEntityName:(NSString *)name andSortKey:(NSString *)key;
/**
 *  根据主键查询
 */
-(id)findByIdWithEntityName:(NSString *)name andKey:(NSString *)key andId:(NSString *)keyId;
/**
*  插入
*/
-(id)insertWithEntityName:(NSString *)name;
/**
 *  删除
 */
-(void)deleteWithEntityName:(NSString *)name andKey:(NSString *)key andId:(NSString *)keyId ;
/**
 *  修改
 */
-(id)modifyWWithEntityName:(NSString *)name andKey:(NSString *)key andId:(NSString *)keyId;

@end
