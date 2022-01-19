//
//  customCategory.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/18.
//

import SwiftUI

struct customCategory: View {
    var text: String = "text"
    var body: some View {
        Button {
            //
        } label: {
            Text(text)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(.black, lineWidth: 3)
        )
    }
}

struct customCategory_Previews: PreviewProvider {
    static var previews: some View {
        customCategory()
    }
}
