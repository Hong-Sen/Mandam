//
//  UserLoginManager.swift
//  Mandam
//
//  Created by 홍세은 on 2022/02/13.
//

import Foundation
import KakaoSDKUser
import Alamofire
import RealmSwift

final class UserLoginManager: NSObject {
    static let shared = UserLoginManager()
    
    func setUser(
        jwtToken: String? = nil,
        loginType: LoginType? = nil,
        profileImage: String? = nil,
        name: String? = nil,
        email: String? = nil
    ) {
        let realm = try! Realm()
        
        // 기존에 유저 정보가 realm에 존재하면
        if let user = realm.objects(User.self).first {
            if let jwtToken = jwtToken {
                user.jwtToken = jwtToken
            }
            if let loginType = loginType {
                user.loginType = loginType
            }
            if let profileImage = profileImage {
                user.profileImage = profileImage
            }
            if let name = name {
                user.name = name
            }
        }
        
        // 존재하지 않으면
        else {
            let user = User()
            if let jwtToken = jwtToken {
                user.jwtToken = jwtToken
            }
            if let loginType = loginType {
                user.loginType = loginType
            }
            if let profileImage = profileImage {
                user.profileImage = profileImage
            }
            if let name = name {
                user.name = name
            }
            try! realm.write({
                realm.add(user)
            })
        }
    }
    
    func doSocialLoginBy(loginType: LoginType) {
        switch loginType {
        case .none:
            break
        case .google:
            doLoginByGoogle()
        case .kakao:
            doLoginByKakao()
        case .facebook:
            doLoginByFacebook()
        case .naver:
            doLoginByNaver()
        }
    }
    
    // 서버 로그인
    // 서버 레지스터
    
    func deleteUser() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(User.self))
        }
    }
}

// Kakao Login
extension UserLoginManager {
    private func doLoginByKakao() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else if let accsessToken = oauthToken?.accessToken {
                    //
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken,error) in
                if let error = error {
                    print(error)
                }
                else if let accsessToken = oauthToken?.accessToken {
                    //
                }
            }
        }
    }
    
    private func doLogoutKakao() {
        self.deleteUser()
        UserApi.shared.logout { error in
            if let error = error {
                print(error)
            }
        }
    }
}

extension UserLoginManager {
    private func doLoginByFacebook() {
        //
    }
}

extension UserLoginManager {
    private func doLoginByNaver() {
        //
    }
}

extension UserLoginManager {
    private func doLoginByGoogle() {
        //
    }
}
