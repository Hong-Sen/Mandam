//
//  SIgnUpView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/29.
//

import SwiftUI

struct SIgnUpView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("icon")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                // Kakao Login
                
                HStack {
                    VStack{
                        Divider()
                    }
                    Text(" 또는 ")
                        .foregroundColor(.gray)
                    VStack{
                        Divider()
                    }
                }
                .padding(.horizontal,30)
                
                HStack {
                    // Meta Login
                    
                    // Naver Login
                    
                    //Google Login
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "xmark")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct SIgnUpView_Previews: PreviewProvider {
    static var previews: some View {
        SIgnUpView()
    }
}
