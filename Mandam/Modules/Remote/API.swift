//
//  API.swift
//  Mandam
//
//  Created by 홍세은 on 2022/02/15.
//

import Foundation
import Alamofire
import RealmSwift

class API {
    // 수정하지 못하게
    private init() {}
    
    // 싱글톤
    static let shared: API = API()
    
    let base_url = "https://unsplash.com/"
    
    func getHeaders(withAuthorization: Bool = false) -> HTTPHeaders? {
        var headers: HTTPHeaders = [
            "content-language": Locale.preferredLanguages.first ?? "ko-KR",
            "platform": "ios",
            "Authorization": "5Wht8VjoBAg4yaRLd5P26SF_S0ze7VZFi_HPk6CNUSc"
        ]
        if withAuthorization {
            let realm = try! Realm()
            if let jwtToken = realm.objects(User.self).first?.jwtToken {
                headers.add(HTTPHeader(name: "Authorization", value: jwtToken))
            }
        }
        return headers
    }
    
}
