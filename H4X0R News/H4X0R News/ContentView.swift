//
//  ContentView.swift
//  H4X0R News
//
//  Created by ryo on 2020/05/11.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                Text("Hello, World!")
                Text("hey")
            }
        .navigationBarTitle("H4X0R News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
