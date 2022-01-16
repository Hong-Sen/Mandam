//
//  ContentView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ConversationView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("대화하기")
                }
            
            CommunityView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("커뮤니티")
                }
                
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
