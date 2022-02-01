//
//  SIgnUpView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/29.
//

import SwiftUI
import FBSDKLoginKit
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire

struct LoginView: View {
    @Binding var isNotLogined: Bool
    var body: some View {
        NavigationView {
            VStack {
                Image("icon")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                // Kakao Login
                KakaoLoginBtn()
                
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
                    FBLoginBtn()
                    // Naver Login
                    
                    //Google Login
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isNotLogined = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct SIgnUpView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isNotLogined: .constant(true))
    }
}
