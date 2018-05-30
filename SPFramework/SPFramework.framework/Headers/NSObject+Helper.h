//
//  NSObject+SPHelper.h
//  SPDevelopmentFramework
//
//  Created by fish on 2018/5/23.
//  Copyright © 2018年 Fish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Helper)

/**
 动态遍历对象然后设置decode代码
 
 @param object 需要调用的对象
 @param aDecoder NSCoder实例
 @return 调用对象
 */
+ (id)sp_decodeClass:(id)object decoder:(NSCoder *)aDecoder;

/**
 动态遍历对象然后设置encode代码
 
 @param object 需要压缩方法的对象
 @param aCoder NSCoder实例
 */
+ (void)sp_encodeClass:(id)object encoder:(NSCoder *)aCoder;
@end
