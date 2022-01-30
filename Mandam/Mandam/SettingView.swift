//
//  SettingView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/22.
//

import SwiftUI

struct SettingView: View {
    @State var isNotLogined: Bool = false
    var body: some View {
        VStack {
            Button {
                isNotLogined = true
            } label: {
                Text("show login view")
            }
            .buttonStyle(.borderedProminent)

        }.fullScreenCover(isPresented: $isNotLogined) {
            LoginView(isNotLogined: $isNotLogined)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
