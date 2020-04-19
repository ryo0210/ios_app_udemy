//
//  item.swift
//  Todoey
//
//  Created by ryo on 2020/04/19.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation

class Item: Encodable {
    var title: String = ""
    var done: Bool = false
}
