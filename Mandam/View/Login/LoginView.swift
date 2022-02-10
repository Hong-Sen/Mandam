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
    @Binding var isShowLoginView: Bool
    var body: some View {
        NavigationView {
            VStack {
                Image("ic_mandam")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                
                Spacer()
                
                SocialLoginBtn(icon: "ic_kakao", title: "카카오로 로그인하기", foregroundColor: .white, backgroundColor: Color(hex: "#FEE500")){
                    //
                }
                
                SocialLoginBtn(icon: "ic_facebook", title: "페이스북으로 로그인하기", foregroundColor: .white, backgroundColor: Color(hex: "#1877F2")){
                    //
                }
                
                SocialLoginBtn(icon: "ic_naver", title: "네이버으로 로그인하기", foregroundColor: .white, backgroundColor: Color(hex: "#03C75A")){
                    //
                }
                
                SocialLoginBtn(icon: "ic_google", title: "구글로 로그인하기", foregroundColor: .black , backgroundColor: .white){
                    //
                }
                .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder())
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowLoginView = false
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
        LoginView(isShowLoginView: .constant(true))
    }
}
