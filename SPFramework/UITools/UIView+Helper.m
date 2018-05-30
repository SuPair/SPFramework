//
//  UIView+Helper.m
//  GaoKao
//
//  Created by fish on 2018/5/28.
//  Copyright © 2018年 SP. All rights reserved.
//

#import "UIView+Helper.h"
#import <objc/runtime.h>

@implementation UIView (Helper)


//可以获取到父容器的控制器的方法,就是这个黑科技.
+ (UIViewController *)sp_viewGetCurrentController:(UIView *)view{
    return [UIView helper_viewGetCurrentController:view];
}

- (UIViewController *)sp_viewGetCurrentController{
    return [UIView helper_viewGetCurrentController:self];
}

+ (UIViewController *)helper_viewGetCurrentController:(UIView *)view{
    UIResponder *responder = view;
    //循环获取下一个响应者,直到响应者是一个UIViewController类的一个对象为止,然后返回该对象.
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}


+ (CGRect)sp_getRelativeCoordinatesWithView:(UIView *)view{
    return [UIView helper_getRelativeCoordinatesWithView:view];
}

- (CGRect)sp_getRelativeCoordinates{
    return [UIView helper_getRelativeCoordinatesWithView:self];
}

+ (CGRect)helper_getRelativeCoordinatesWithView:(UIView *)view{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[view convertRect: view.bounds toView:window];
    return rect;
}

- (id)sp_loadNibByName:(NSString *)name{
    return [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject];
}

- (void)sp_initilizeWithData:(NSMutableDictionary *)data{
    u_int count;
    objc_property_t * properties  = class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {
        objc_property_t property = properties[i];
        const char * type =property_getAttributes(property);
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        if ([[NSString stringWithUTF8String:type] containsString:@"UILabel"]) {
            NSString *path = [NSString stringWithFormat:@"%@.text", name];
            if ([data.allKeys containsObject:name]) {
                [self setValue:data[name] forKeyPath:path];
            }
        } else if ([[NSString stringWithUTF8String:type] containsString:@"UIImageView"]) {
            NSString *path = [NSString stringWithFormat:@"%@.image", name];
            if ([data.allKeys containsObject:name]) {
                [self setValue:[UIImage imageNamed:data[name]] forKeyPath:path];
            }
        }
    }
    free(properties);
}

- (void)sp_setBorderWithBorderDirection:(SPViewBorderDirection)direction Color:(UIColor *)color{
    float widht  = 0;
    if (direction == SPViewBorderDirectionTop || direction == SPViewBorderDirectionBottom) {
        widht = self.bounds.size.width;
    }else{
        widht = self.bounds.size.height;
    }
    [self sp_setBorderWithBorderDirection:direction Color:color Width:widht];
}

- (void)sp_setBorderWithBorderDirection:(SPViewBorderDirection)direction Color:(UIColor *)color Width:(CGFloat)width{
    if (direction == SPViewBorderDirectionTop) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, self.bounds.size.width, width);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    if (direction == SPViewBorderDirectionLeft) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, self.bounds.size.height);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    if (direction == SPViewBorderDirectionBottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, self.bounds.size.height - width, self.bounds.size.width, width);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
    if (direction == SPViewBorderDirectionRight) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(self.bounds.size.width - width, 0, width, self.bounds.size.height);
        layer.backgroundColor = color.CGColor;
        [self.layer addSublayer:layer];
    }
}


@end
