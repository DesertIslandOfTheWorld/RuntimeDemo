//
//  ViewController.swift
//  RuntimeDemo
//
//  Created by 李云鹏 on 2017/12/21.
//  Copyright © 2017年 Island. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let student = SwiftStudent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 60, height: 35))
//        button.tapTimeInterval = 4
//        view.addSubview(button)
//        print("TapTimeInterval of the button: \(button.tapTimeInterval)")
        
//        printPropertyName(of: SwiftStudent.self)
        
        student.addObserver(self, forKeyPath: "no", options: [.old, .new], context: nil)
    }
}

/** 事件 */
extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        student.no = "002"
    }
}

/** KVO */
extension ViewController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let newValue = change?[.newKey], let oldValue = change?[.oldKey] else {
            return
        }
        print("\n     New value: \(newValue)")
        print("     Old value: \(oldValue)")
    }
}

/** 其他 */
extension ViewController {
    func printPropertyName(of cls: AnyClass) {
        /** 记录属性个数 */
        var propertyCount: UInt32 = 0
        /** 获取所有属性 */
        guard let propertyList = class_copyPropertyList(cls, &propertyCount) else {
            return
        }
        /** 遍历所有属性 */
        print("\n")
        for index in 0..<numericCast(propertyCount) {
            let property: objc_property_t = propertyList[index]
            /** 获取属性名 */
            if let propertyName = String(utf8String: property_getName(property)) {
                print("     property: \(propertyName)")
            }
        }
    }
}
