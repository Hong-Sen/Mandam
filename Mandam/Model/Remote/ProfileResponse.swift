//
//  ProfileResponse.swift
//
//  Created by νμΈμ on 2022/02/15.
//

import Foundation

struct ProfileResponse: Codable {
    
    var data: Data?
    
    struct Data: Codable {
        
        var type: LoginType
        
        var email: String
        var userId: String
        var userName: String
        var profileImage: String
        
    }
    
    // ????
    class ProfileResponseDecoder: JSONDecoder {
        let dateFormatter = DateFormatter()

        override init() {
            super.init()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            dateDecodingStrategy = .formatted(dateFormatter)
        }
    }
}
