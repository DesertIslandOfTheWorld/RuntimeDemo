//
//  SwiftStudent.swift
//  RuntimeDemo
//
//  Created by 李云鹏 on 2018/1/5.
//  Copyright © 2018年 Island. All rights reserved.
//

import UIKit

class SwiftStudent: ObjectiveCPerson {
    override var name: String! {
        set {
            super.name = newValue
        }
        get {
            return super.name
        }
    }
    @objc dynamic var no = "001"
}
