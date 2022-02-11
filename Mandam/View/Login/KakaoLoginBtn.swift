//
//  KakaoLoginBtn.swift
//  Mandam
//
//  Created by 홍세은 on 2022/02/01.
//

import SwiftUI
import KakaoSDKAuth
import KakaoSDKUser
import Alamofire

struct KakaoLoginBtn: View {
    var body: some View {
        Button {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    print(oauthToken)
                    print(error)
                }
            } else {
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    print(oauthToken)
                    print(error)
                }
            }
        } label : {
            HStack(alignment: .center) {
                Image("kakao icon")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .padding(.leading, 10)
                Spacer()
                Text("카카오톡으로 로그인 하기")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }
        .background(.yellow)
        .cornerRadius(50)
        .padding(.horizontal, 50)
        
        //ios가 버전이 올라감에 따라 sceneDelegate를 더이상 사용하지 않게되었다
        //그래서 로그인을 한후 리턴값을 인식을 하여야하는데 해당 코드를 적어주지않으면 리턴값을 인식되지않는다
        //swiftUI로 바뀌면서 가장큰 차이점이다.
        .onOpenURL(perform: { url in
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        })
    }
}

struct KakaoLoginBtn_Previews: PreviewProvider {
    static var previews: some View {
        KakaoLoginBtn()
    }
}
