//
//  ConversationView.swift
//  Mandam
//
//  Created by 홍세은 on 2022/01/16.
//

import SwiftUI

struct ConversationView: View {
    @State private var isShowFilter: Bool = false;
    @State private var searchString : String = ""
    @State private var isSearch : Bool = false;
    private var conversationList : [String] = ["너의 MBTI가 무엇이니?", "올 때 뭐 타고 왔니?"]
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(isShowing: $isSearch, text: $searchString)
                List{
                    ForEach(conversationList.filter{$0.contains(searchString) || searchString == ""}, id:\.self){ item in
                        Text(item)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("대화하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSearch = !isSearch
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowFilter = true
                    } label: {
                        Text("필터")
                    }
                    .sheet(isPresented: $isShowFilter) {
                        FilterView(isShowFilter: $isShowFilter)
                    }
                }
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
