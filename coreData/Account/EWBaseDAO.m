//
//  EWBaseDAO.m
//  coreData
//
//  Created by wansy on 15/6/4.
//  Copyright (c) 2015年 wansy. All rights reserved.
//

#import "EWBaseDAO.h"
#import "Account.h"

@implementation EWBaseDAO
/**
 *  查询所有
 */
-(NSArray *)findAllWithEntityName:(NSString *)name andSortKey:(NSString *)key{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    //实体关联描述类
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:name inManagedObjectContext:cxt];
    
    //数据提取请求类
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    //排序描述类
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error= nil;
    NSArray *listData = [cxt executeFetchRequest:request error:&error];
    
    return listData;

}
/**
 *  根据主键查询
 */
-(id)findByIdWithEntityName:(NSString *)name andKey:(NSString *)key andId:(NSString *)keyId{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    //实体关联描述类
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:name inManagedObjectContext:cxt];
    
    //数据提取请求类
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@",key,keyId];
    
    [request setPredicate:predicate];
    
    NSError *error= nil;
    NSArray *listData = [cxt executeFetchRequest:request error:&error];
    
    if (listData.count > 0) {
        return [listData lastObject];
    }
    return nil;
}
/**
 *  插入
 */
-(id) insertWithEntityName:(NSString *)name{
    
    NSManagedObjectContext *cxt = [self managedObjectContext];
    
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:cxt];
}
/**
 *  删除
 */
-(void)deleteWithEntityName:(NSString *)name andKey:(NSString *)key andId:(NSString *)keyId
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:name inManagedObjectContext:cxt];
    
    //数据提取请求类
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@",key,keyId];
    
    [request setPredicate:predicate];
    
    NSError *error= nil;
    NSArray *listData = [cxt executeFetchRequest:request error:&error];
    
    if (listData.count>0) {
        [self.managedObjectContext deleteObject:[listData lastObject]];
        
        NSError *saveError = nil;
        if ([self.managedObjectContext save:&saveError]) {
            NSLog(@"删除数据成功");
        }else{
            NSLog(@"删除数据失败");
        }
        
    }
}
/**
 *  修改
 */
-(id)modifyWWithEntityName:(NSString *)name andKey:(NSString *)key andId:(NSString *)keyId{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:name inManagedObjectContext:cxt];
    
    //数据提取请求类
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@",key,keyId];
    
    [request setPredicate:predicate];
    
    NSError *error= nil;
    NSArray *listData = [cxt executeFetchRequest:request error:&error];
    
    
    if (listData.count>0) {
        return [listData lastObject];
    }
    return nil;

}
@end
