//
//  UserLoginManager.swift
//  Mandam
//
//  Created by 홍세은 on 2022/02/13.
//

import Foundation
import KakaoSDKUser
import FBSDKLoginKit
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
    
    // 서버 레지스터
    func doServerRegister(type: LoginType, token: String) {
        Repositories.shared.registerWithSocialToken(type: type, token: token) { status, registerResponse in
            switch status {
            case .ok:
                if let jwtToken = registerResponse?.data {
                    self.setUser(jwtToken: jwtToken, loginType: type)
                     self.getUserProfile()
                }
        
            case .conflict: // 회원가입하려는데 이미 유저정보가 존재함 -> 로그인 진행
                self.doServerRegister(type: type, token: token)
            default:
                break
            }
        }
    }
    
    // 서버 로그인
    func doServerLogin(type: LoginType, token: String) {
        Repositories.shared.loginWithSocialToken(type: type, token: token) { status, LoginResponse in
            switch status {
            case .ok: // 로그인 성공
                if let jwtToken = LoginResponse?.data {
                    self.setUser(jwtToken: jwtToken, loginType: type)
                         self.getUserProfile()
                }
            default:
                break
            }
        }
    }

    func getUserProfile() {
        Repositories.shared.fetchProfileInfo { status, profileResponse in
            switch status {
            case .ok:
                if let userInfo = profileResponse?.data {
                    self.setUser(
                        profileImage: userInfo.profileImage,
                        name: userInfo.userName,
                        email: userInfo.email
                    )
                }
            default:
                break
            }
        }
    }
    
    
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
                    self.doServerRegister(type: .kakao, token: accsessToken)
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken,error) in
                if let error = error {
                    print(error)
                }
                else if let accsessToken = oauthToken?.accessToken {
                    self.doServerRegister(type: .kakao, token: accsessToken)
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
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [], viewController: nil) {result in
            switch result {
            case .failed(let error):
                print(error)
            case .cancelled:
                break
            case .success(granted: _, declined: _, token: let accessToken):
                if let token = accessToken?.tokenString {
                    self.doServerRegister(type: .facebook, token: token)
                }
            }
        }
    }
    
    private func doLogoutFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
        deleteUser()
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
