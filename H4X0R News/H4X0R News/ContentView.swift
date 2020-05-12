//
//  ContentView.swift
//  H4X0R News
//
//  Created by ryo on 2020/05/11.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                Text(String(post.points))
                Text(post.title)
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// PostをIdentifiableプロトコルに準拠させることで、
// リストがこれに基づいてPostオブジェクトの順序を認識できるようになる。
//struct Post: Identifiable {
//    let id: String
//    let title: String
//}
// データの一部を取得し、そのデータを使用してその行を計算するものを使用します。
