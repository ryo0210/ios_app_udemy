//
//  WebView.swift
//  H4X0R News
//
//  Created by ryo on 2020/05/13.
//  Copyright © 2020 ryo. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let urlString:  String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
        typealias UIViewType = WKWebView
    }
}
