//
//  ConversationView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/16.
//

import SwiftUI

struct ConversationView: View {
    @State private var searchString : String = ""
    @State private var isSearch : Bool = false;
    private var conversationList : [String] = ["너의 MBTI가 무엇이니?", "올 때 뭐 타고 왔니?"]
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing){
                Button {
                    //
                } label: {
                    Text("필터")
                }
                .padding(.trailing, 30)

                List{
                    ForEach(conversationList, id:\.self){ item in
                        Text(item)
                    }
                }
            }
                
            .navigationTitle("대화하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSearch = true;
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
            }
        }
        //        .searchable(text: $searchString)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
