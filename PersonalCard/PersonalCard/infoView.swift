//
//  infoView.swift
//  PersonalCard
//
//  Created by ryo on 2020/05/10.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct infoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50.0)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(.green)
                Text(text)
            })
            .padding(.all)
    }
}

struct infoView_Previews: PreviewProvider {
    static var previews: some View {
        infoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
