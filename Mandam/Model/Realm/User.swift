//
//  User.swift
//  Mandam
//
//  Created by 홍세은 on 2022/02/09.
//

import SwiftUI
import RealmSwift
import KakaoSDKCommon

enum LoginType: String, PersistableEnum, Codable {
    case none
    case google
    case kakao
    case facebook
    case naver
}

final class User: Object, ObjectKeyIdentifiable {
    @Persisted var jwtToken: String = ""
    @Persisted var loginType: LoginType = .none
    @Persisted var name: String = "???"
    @Persisted var email: String = ""
    @Persisted var profileImage: String = ""
}
