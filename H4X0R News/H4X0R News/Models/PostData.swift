//
//  PostData.swift
//  H4X0R News
//
//  Created by ryo on 2020/05/12.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String
}
