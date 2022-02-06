//
//  SettingView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/22.
//

import SwiftUI

struct SettingView: View {
    @State var isNotLogined: Bool = false
    @State var name: String = "닉네임"
    var body: some View {
        VStack {
            HStack {
                Text("\(name) 님 안녕하세요!")
                Spacer()
                Button {
                    //
                } label: {
                    Image(systemName: "pencil")
                }

            }
            .padding()
            
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
