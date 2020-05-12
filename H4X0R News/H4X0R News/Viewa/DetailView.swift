//
//  DetailView.swift
//  H4X0R News
//
//  Created by ryo on 2020/05/13.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
