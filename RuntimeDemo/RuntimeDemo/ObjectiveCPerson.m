//
//  ObjectiveCPerson.m
//  RuntimeDemo
//
//  Created by 李云鹏 on 2018/1/5.
//  Copyright © 2018年 Island. All rights reserved.
//

#import "RuntimeDemo-Swift.h"

#import "ObjectiveCPerson.h"

@implementation ObjectiveCPerson

- (void)printCar {
    SwiftCar *car = [[SwiftCar alloc] init];
    NSLog(@"%@", car.trademark);
}

@end
