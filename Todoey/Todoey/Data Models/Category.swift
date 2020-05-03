//
//  Category.swift
//  Todoey
//
//  Created by ryo on 2020/04/21.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    // 子関係を定義する。
    let items = List<Item>()
}
