//
//  UIButton+Extension.swift
//  RuntimeDemo
//
//  Created by 李云鹏 on 2018/1/5.
//  Copyright © 2018年 Island. All rights reserved.
//

import UIKit

extension UIButton {
    static let tapTimeIntervalAssociatedKey = UnsafeRawPointer(bitPattern: "UIButton.AssociatedKey.tapTimeInterval".hashValue)!
    var tapTimeInterval: Double {
        set {
            objc_setAssociatedObject(self, UIButton.tapTimeIntervalAssociatedKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            let timeInterval = objc_getAssociatedObject(self, UIButton.tapTimeIntervalAssociatedKey) as? Double
            return timeInterval ?? 0.0
        }
    }
    
    /// 1.定义将要替换系统方法的方法实现
    @objc func id_sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        self.id_sendAction(action, to: target, for: event)
    }
    static func methodSwizzling() {
        // 2.将 Selector 转换成 Method
        let aSelector = #selector(UIButton.sendAction(_:to:for:))
        let bSelector = #selector(UIButton.id_sendAction(_:to:for:))
        let systematicMethod = class_getInstanceMethod(UIButton.self, aSelector)
        let localMethod = class_getInstanceMethod(UIButton.self, bSelector)
        // 3.判断系统是否实现了 systematicSelector
        let systematicMethodIsExisted = class_addMethod(UIButton.self, aSelector, method_getImplementation(localMethod!), method_getTypeEncoding(localMethod!))
        // 4.交换方法实现
        if systematicMethodIsExisted {
            // 替换 localSelector 的实现
            class_replaceMethod(UIButton.self, bSelector, method_getImplementation(systematicMethod!), method_getTypeEncoding(systematicMethod!))
        } else {
            // 交换 systematicMethod 和 localMethod
            method_exchangeImplementations(systematicMethod!, localMethod!)
        }
    }
}
