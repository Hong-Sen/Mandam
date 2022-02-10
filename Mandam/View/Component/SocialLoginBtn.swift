//
//  SocialLoginBtn.swift
//  Mandam
//
//  Created by 홍세은 on 2022/02/09.
//

import SwiftUI

struct SocialLoginBtn: View {
    
    let icon: String
    let title: String
    let foregroundColor: Color
    let backgroundColor: Color
    
    let action: () -> Void
    
    init(
        icon: String,
        title: String,
        foregroundColor: Color,
        backgroundColor: Color,
        action: @escaping () -> Void) {
            self.icon = icon
            self.title = title
            self.foregroundColor = foregroundColor
            self.backgroundColor = backgroundColor
            self.action = action
        }
    
    var body: some View {
        Button {
            self.action()
        } label: {
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .leading)
                    .scaledToFit()
                
                Text(title)
                    .foregroundColor(foregroundColor)
            }
            .frame(maxWidth:.infinity, maxHeight: 50)
            .padding(.horizontal, 10)
            .background(backgroundColor)
            .cornerRadius(30)
        }
        
    }
}

struct SocialLoginBtn_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginBtn(icon: "ic_kakao", title: "KAKAO로 로그인 하기", foregroundColor: .white, backgroundColor: Color(hex: "#F9E000")){
            
        }
    }
}
