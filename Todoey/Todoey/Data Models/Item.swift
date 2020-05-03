//
//  Item.swift
//  Todoey
//
//  Created by ryo on 2020/04/21.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    // 親関係を定義する。
    // LinkingObjectsはプロパティ関係を介して、モデルオブジェクトとリンクされている0個以上のオブジェクトを表す自動更新コンテナです。
    // 要約：逆の関係を定義している。
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
