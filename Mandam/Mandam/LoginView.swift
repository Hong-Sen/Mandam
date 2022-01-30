//
//  SIgnUpView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/29.
//

import SwiftUI
import FBSDKLoginKit

struct LoginView: View {
    @Binding var isNotLogined: Bool
    var body: some View {
        NavigationView {
            VStack {
                Image("icon")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                // Kakao Login
                
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

struct FBLoginBtn: View {
    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = ""
    @State var manager = LoginManager()
    
    var body: some View {
        VStack(spacing: 25) {
            Button {
                if logged {
                    manager.logOut()
                    email = ""
                    logged = false
                }
                else{
                    manager.logIn(permissions: ["public_profile", "email"], from: nil) { (result, err) in
                        if err != nil {
                            print(err!.localizedDescription)
                            return
                        }
                        
                        if !result!.isCancelled{
                            logged = true
                            let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email"])
                            
                            request.start { (_, res, _) in
                                guard let profileDate = res as? [String : Any] else{return}
                                
                                email = profileDate["email"] as! String
                            }
                        }
                    }
                }
            } label: {
                HStack(alignment: .center) {
                    Image("fb icon")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .leading)
                        .padding(.leading, 10)
                    Spacer()
                    Text(logged ? "로그아웃" : "페이스북 로그인")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
            .background(.blue)
            .cornerRadius(50)
            .padding(.horizontal, 50)
            
            Text(email)
                .bold()

        }
    }
}
