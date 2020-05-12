//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by ryo on 2020/05/12.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation
// 結果をNetworkManagerからContentView内のリストに渡す。
// ObservableObject: 1つまたは複数のプロパティを実際に興味のある人にブロードキャストできる。
class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
