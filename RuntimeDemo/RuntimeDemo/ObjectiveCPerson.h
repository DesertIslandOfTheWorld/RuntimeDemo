//
//  ObjectiveCPerson.h
//  RuntimeDemo
//
//  Created by 李云鹏 on 2018/1/5.
//  Copyright © 2018年 Island. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectiveCPerson : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) NSInteger age;

- (void)printCar;

@end
