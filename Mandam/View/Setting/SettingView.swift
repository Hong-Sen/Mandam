//
//  SettingView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/22.
//

import SwiftUI
import RealmSwift

struct SettingView: View {
    @ObservedRealmObject var user: User
    @State var appVersion: String = "1.0"
    @State var isShowLoginView: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack() {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.trailing)
                    
                    Text(user.name)
                        .font(.system(size: 30))
                    Text("님 안녕하세요 👋")
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: "#c0c5ce"), lineWidth: 1)
                )
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("커뮤니티")
                            .font(.system(size: 18))
                            .bold()
                        
                        Spacer()
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("닉네임 설정")
                            .foregroundColor(.black)
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("프로필 이미지 변경")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: "#c0c5ce"), lineWidth: 1)
                )
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("이용안내")
                        .font(.system(size: 18))
                        .bold()
                    
                    HStack {
                        Text("앱 버전")
                        Spacer()
                        Text(appVersion)
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("서비스 이용약관")
                            .foregroundColor(.black)
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("개인정보처리방침")
                            .foregroundColor(.black)
                    }
                    
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: "#c0c5ce"), lineWidth: 1)
                )
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("계정")
                            .font(.system(size: 18))
                            .bold()
                        
                        Spacer()
                    }
                    
                    Button {
                        isShowLoginView = true
                    } label: {
                        Text("로그인")
                            .foregroundColor(.black)
                    }
                    .fullScreenCover(isPresented: $isShowLoginView){
                        LoginView(isShowLoginView: $isShowLoginView)
                    }
                    
                    Button {
                        //
                    } label: {
                        Text("로그아웃")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: "#c0c5ce"), lineWidth: 1)
                )
                .padding(.horizontal)
                
            }
            .navigationTitle("마이 페이지")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        let user: User = User()
        user.name = "홍센"
        user.email = "hse0805@gmail.com"
        user.profileImage = "https://cdn.crowdpic.net/detail-thumb/thumb_d_C6386337D543E5BD60DB8168D08F5CFA.jpg"
        return SettingView(user: .init(value: user))
    }
}
