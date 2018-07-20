//
//  UIView+Helper.h
//  GaoKao
//
//  Created by fish on 2018/5/28.
//  Copyright © 2018年 SP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SPViewBorderDirection){
    SPViewBorderDirectionTop = 0,
    SPViewBorderDirectionLeft,
    SPViewBorderDirectionRight,
    SPViewBorderDirectionBottom,
};

static NSString *const SPKeyPathCustom = @"kSPKeyPathCustom";
static NSString *const SPKeyPathCustomKey = @"kSPKeyPathCustomKey";
static NSString *const SPKeyPathCustomValue = @"kSPKeyPathCustomValue";

@interface UIView (Helper)


/**
 获取当前视图的控制器

 @param view 当前视图
 @return 当前视图控制器   
 */
+ (UIViewController *)sp_viewGetCurrentController:(UIView *)view;


/**
 获取当前视图的控制器

 @return 当前视图控制器 
 */
- (UIViewController *)sp_viewGetCurrentController;


/**
 获取视图所在屏幕相对位置

 @param view 视图
 @return 返回相对坐标
 */
+ (CGRect)sp_getRelativeCoordinatesWithView:(UIView *)view;


/**
 获取视图所在屏幕相对位置

 @return 返回相对坐标
 */
- (CGRect)sp_getRelativeCoordinates;


/**
 加载nib

 @param name 名字
 @return 对象
 */
- (id)sp_loadNibByName:(NSString *)name;


/**
 通过字典给view的属性赋值

 @param data 数据键值对{view属性名：值}
 */
- (void)sp_initilizeWithData:(NSMutableDictionary *)data;DEPRECATED_MSG_ATTRIBUTE("这个函数命名和实现不太规范，现已经修改为另一个函数'(void)sp_setKeyPathValueByData:(NSMutableDictionary *)data IsCustomPriority:(BOOL)isCustomPriority'来替换");


/**
 给View的某一条边添加一条线（宽度为当前宽度）

 @param direction 方向
 @param color 颜色
 */
- (void)sp_setBorderWithBorderDirection:(SPViewBorderDirection)direction Color:(UIColor *)color;


/**
 给View的某一条边添加一条线 自定义宽度

 @param direction 方向
 @param color 颜色
 @param width 宽度
 */
- (void)sp_setBorderWithBorderDirection:(SPViewBorderDirection)direction Color:(UIColor *)color Width:(CGFloat)width;
@end
