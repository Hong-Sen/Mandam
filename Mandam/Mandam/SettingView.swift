//
//  SettingView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/22.
//

import SwiftUI

struct SettingView: View {
    @State var isNotLogined: Bool = true
    var body: some View {
        VStack {
            //
        }.fullScreenCover(isPresented: $isNotLogined) {
            SIgnUpView()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
