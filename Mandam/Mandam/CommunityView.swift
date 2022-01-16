//
//  CommunityView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/16.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("새로운 대화법을 올려주세요!")
                    .foregroundColor(.gray)
                Text("Opinion")
            }
            
            
                .navigationTitle("커뮤니티")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            //
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            //
                        } label: {
                            Image(systemName: "person")
                        }
                    }
                    
                }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
